# Repositories Profile

Repository-scoped workspace assets for source checkouts.

## Purpose

This profile is the source of truth for repository-specific workspace assets
that are synchronized into individual source checkouts. It does not own
machine- or environment-wide configuration.

Each child directory holds the assets and `content-hub.yaml` rules for one source
repository. Set `SRC_PATH` to the checkout that should receive or supply the
synchronized files.

## Operations

From `profile/repositories`, enter the profile directory for the repository you
want to sync.

Deploy assets into the target checkout:

```bash
cd <repo>
SRC_PATH=/path/to/<repo> uv run contentctl deploy src
```

Adopt changes from the target checkout:

```bash
cd <repo>
SRC_PATH=/path/to/<repo> uv run contentctl adopt src
```
