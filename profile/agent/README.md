# Agent Profile

Agent skills and configuration.

## Purpose

This profile keeps agent-authored assets in one place so their structure,
naming, and prose style stay consistent.

Sync rules live in `content-hub.yaml`.

## Operations

Deploy the profile to all configured agent workspaces:

```bash
uv run contentctl deploy --all-workspaces
```

Adopt changes from the `agents` workspace:

```bash
uv run contentctl adopt agents
```
