# Repositories Profile

Repository-scoped workspace assets for source checkouts.

## Purpose

This profile stores workspace assets that belong to individual repositories
instead of the machine, WSL system, or agent profile.

Each child directory is one repository profile. Set `SRC_PATH` to the checkout
that should receive or supply the synced files. Sync rules live in each child's
`content-hub.yaml`.

## Operations

From `profile/repositories`, enter the profile directory for the repository you
want to sync.

Deploy assets into the target checkout:

```bash
cd <repo>
SRC_PATH=/src/<repo> uv run contentctl deploy src
```

Adopt changes from the target checkout:

```bash
cd <repo>
SRC_PATH=/src/<repo> uv run contentctl adopt src
```
