"""Build notifications from Codex Stop events."""

from contextlib import closing
import json
from pathlib import Path
import sqlite3
from urllib.parse import quote

from . import Notification
from .text import markdown_text


def thread_details(codex_home: Path, session_id: str) -> dict:
    """Read the local conversation title."""
    details = {}
    database = max(
        codex_home.glob("state_*.sqlite"),
        key=lambda path: int(path.stem.removeprefix("state_")),
        default=None,
    )
    if database is not None:
        try:
            with closing(
                sqlite3.connect(database.as_uri() + "?mode=ro", uri=True, timeout=1)
            ) as db:
                row = db.execute(
                    "SELECT title FROM threads WHERE id = ?", (session_id,)
                ).fetchone()
            if row:
                details["title"] = row[0]
        except sqlite3.Error:
            pass

    # The index also contains titles renamed by the user.
    try:
        with (codex_home / "session_index.jsonl").open(encoding="utf-8") as index:
            for line in index:
                try:
                    entry = json.loads(line)
                except json.JSONDecodeError:
                    continue
                if entry["id"] == session_id and entry.get("thread_name"):
                    details["title"] = entry["thread_name"]
    except OSError:
        pass
    return details


def build_notification(
    event: dict,
    *,
    codex_home: Path,
    conversation_url_template: str | None = None,
) -> Notification:
    """Combine the reply payload with the local conversation title."""
    session_id = event["session_id"]
    details = thread_details(codex_home, session_id)
    cwd = event["cwd"]
    workspace = Path(cwd).name or cwd
    title = details.get("title") or session_id
    reply = event.get("last_assistant_message")
    text = markdown_text(reply) if reply is not None else ""
    url = (
        conversation_url_template.format(session_id=quote(session_id, safe=""))
        if conversation_url_template
        else None
    )
    return Notification(
        source="Codex",
        session_id=session_id,
        turn_id=event.get("turn_id"),
        workspace=" ".join(workspace.split()),
        title=" ".join(title.split()),
        text=text,
        url=url,
    )
