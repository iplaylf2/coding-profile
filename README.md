# Coding Profile

Source of truth for a personal coding environment: shared defaults,
conventions, and configuration assets for machines, workspaces, and
repositories.

The repository is organized as a set of profiles. In each profile, the README
explains intent and maintenance workflow; `content-hub.yaml` defines the exact
sync rules.

## Profiles

- `profile/agent`: agent skills and configuration.
- `profile/repositories`: repository-scoped editor and workspace assets.
- `profile/wsl`: NixOS-on-WSL system configuration.

## Setup

Install the project tooling:

```bash
uv sync
```

## Workflow

Use a profile README for commands and required context, such as environment
variables, elevated privileges, or follow-up commands. Use `content-hub.yaml`
when changing synced paths, targets, or exclusions.

## Notes

Manual copying is possible, but `contentctl` is the canonical workflow because
it keeps source paths, target workspaces, and exclusions explicit.
