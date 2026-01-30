# Coding Profile

A personal, repeatable **coding setup kit**: the defaults, conventions, and small assets I like to carry across machines and workspaces.

This repo is intentionally opinionated and **not meant to be universal**. Treat it as my “coding profile” source of truth—useful as-is for me, and adaptable for others if you’re willing to reshape it.

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

Adopt updates back into this repo (example: `codex`):

```bash
cd profile/agent
uv run contentctl adopt codex
```

`profile/agent/content-hub.yaml` defines how `contentctl` applies this profile (workspaces, rules, mappings). Reuse by editing this file.

## Notes

Manual copying is also fine if you don’t want the tooling.
