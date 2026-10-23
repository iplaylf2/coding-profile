#!/usr/bin/env python3
"""Build and deliver Codex reply notifications."""

import argparse
from dataclasses import asdict
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import sys

from notifications import DeliveryError, feishu
from notifications.codex import build_notification


def error_description(error: Exception) -> str:
    """Keep credentials, response bodies, and reply content out of diagnostics."""
    if isinstance(error, DeliveryError):
        return str(error)
    return type(error).__name__


def record(log_path: Path, event: dict, status: str, error: str | None = None):
    entry = {
        "time": datetime.now(timezone.utc).isoformat(),
        "session_id": event.get("session_id"),
        "turn_id": event.get("turn_id"),
        "status": status,
    }
    if error:
        entry["error"] = error
    log_path.parent.mkdir(parents=True, exist_ok=True)
    with os.fdopen(
        os.open(log_path, os.O_WRONLY | os.O_CREAT | os.O_APPEND, 0o600), "a"
    ) as log:
        log.write(json.dumps(entry, ensure_ascii=False) + "\n")


def main(argv=None) -> int:
    codex_home = Path(os.environ.get("CODEX_HOME", "~/.codex")).expanduser().resolve()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--config",
        type=Path,
        default=Path(
            os.environ.get(
                "CODEX_NOTIFICATION_CONFIG", codex_home / "notifications.json"
            )
        ),
        help="Host settings file (default: %(default)s)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Print structured notification data without sending it",
    )
    args = parser.parse_args(argv)
    event = {}
    try:
        event = json.load(sys.stdin)
        config_path = args.config.expanduser()
        try:
            settings = json.loads(config_path.read_text(encoding="utf-8"))
        except FileNotFoundError:
            if not args.dry_run:
                raise
            settings = {}
        notification = build_notification(
            event,
            codex_home=codex_home,
            conversation_url_template=settings.get("conversation_url_template"),
        )
        if args.dry_run:
            print(json.dumps(asdict(notification), ensure_ascii=False, indent=2))
            return 0

        feishu.send(notification, **settings["feishu"])
        record(codex_home / "hooks" / "notifications.log", event, "sent")
    except Exception as error:
        description = error_description(error)
        if args.dry_run:
            print(description, file=sys.stderr)
            return 1
        try:
            record(
                codex_home / "hooks" / "notifications.log", event, "failed", description
            )
        except OSError:
            pass
    finally:
        if not args.dry_run:
            # Notification failures must never request another Codex turn.
            print("{}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
