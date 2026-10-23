# Codex Profile

Codex user configuration, including notifications for completed replies.

## Structure

- [`hooks.json`](hooks.json): asynchronous `Stop` hook registration.
- [`hooks/`](hooks/): structured notification data, delivery adapters, and Python
  dependency declarations.
- [`notifications.example.json`](notifications.example.json): host settings
  template.
- [`content-hub.yaml`](content-hub.yaml): synchronized paths and workspace target.

The hook builds structured reply notifications and passes them to a delivery
adapter. The current selection in [`hooks/notify.py`](hooks/notify.py) is
[`notifications.feishu`](hooks/notifications/feishu.py).

## Host Configuration

The hook uses host-provided `python3` (Python 3.10 or later) and the packages in
[`hooks/requirements.txt`](hooks/requirements.txt).

Settings follow `notifications.example.json`. `conversation_url_template` is
optional and expands `{session_id}`; the example links to a local VS Code
session. The selected Feishu adapter requires a host-provided
`feishu.webhook_url`.

`CODEX_HOME` identifies the Codex data directory and defaults to `~/.codex`.
Settings default to `<CODEX_HOME>/notifications.json`; `CODEX_NOTIFICATION_CONFIG`
selects another file, and `--config PATH` overrides it. Delivery status is logged
to `<CODEX_HOME>/hooks/notifications.log`.

Credentials, session data, logs, installed dependencies, and hook trust remain
host state. Deployed hook definitions require review and trust in Codex.

## Synchronization

Run these commands from `profile/codex`.

The `codex` workspace targets `${HOME}/.codex`. Its managed files are declared in
`content-hub.yaml`; a different Codex data directory also requires updating that
workspace target.

Preview and deploy the Codex hook:

```bash
uv run contentctl --dry-run deploy codex
uv run contentctl deploy codex
```

Adopt synchronized content from the host workspace:

```bash
uv run contentctl adopt codex
```
