# Coding Profile

A personal, repeatable **coding setup kit**: the defaults, conventions, and small assets I like to carry across machines and workspaces.

This repo is intentionally opinionated and **not meant to be universal**. Treat it as my “coding profile” source of truth—useful as-is for me, and adaptable for others if you’re willing to reshape it.

## Use

Sync the CLI tooling and dependencies:

```bash
uv sync
````

Deploy this profile to all configured workspaces:

```bash
uv run contentctl deploy --all-workspaces
```

Adopt updates from a workspace back into this repo (example: `codex`):

```bash
uv run contentctl adopt codex
```

## Configure

`content-hub.yaml` defines how `contentctl` applies this profile (workspaces, rules, mappings). If you want to reuse the workflow, start by editing that file.

Manual copying is also fine if you don’t want the tooling.
