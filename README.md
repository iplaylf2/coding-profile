# Coding Profile

Personal coding setup: defaults, conventions, and configuration assets that sync across machines and workspaces.

## Setup

Sync the CLI tooling and dependencies:

```bash
uv sync
```

## Example: Agent

One example using `contentctl` to sync a profile slice:

```bash
cd profile/agent
uv run contentctl deploy --all-workspaces
```

Adopt changes back into this repo (example: `codex`):

```bash
cd profile/agent
uv run contentctl adopt codex
```

`profile/agent/content-hub.yaml` defines how `contentctl` applies this profile .

## Notes

Manual copying is also fine if you don’t want the tooling.
