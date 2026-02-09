# Repositories Profile

Repository-scoped workspace assets.

## Purpose

Manages repository-scoped assets through `contentctl`. Synced paths are defined by each repository's `content-hub` configuration, with `SRC_PATH` as the source workspace path.

## Operations

Deploy:

```bash
cd <repo>
SRC_PATH=/src/<repo> uv run contentctl deploy src
```

Adopt changes:

```bash
cd <repo>
SRC_PATH=/src/<repo> uv run contentctl adopt src
```
