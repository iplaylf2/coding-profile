# Development Tooling

Cross-platform repository maintenance configuration lives entirely in this
directory.

## Bootstrap

Install [aqua](https://aquaproj.github.io/docs/install/) and ensure its binary
directory is on `PATH`. Aqua itself is the only external prerequisite because
no script runtime can be assumed across Linux, macOS, and Windows.

Enter this directory so aqua and Task can discover their configuration:

```bash
cd .dev
```

Initialize the tools pinned by aqua:

```bash
aqua exec -- task init
```

## Tasks

Run all checks:

```bash
aqua exec -- task check
```

Format supported files:

```bash
aqua exec -- task format
```

Task is itself pinned in `aqua.yaml`, so `aqua exec` installs the correct
version on first use. The task definitions use no platform-specific shell
scripts. Aqua, Task, Node.js, Oxfmt, and CSpell belong to this maintenance
workflow; the project Python environment and its user-installed uv do not.

The tasks set their working directory to the repository root when operating on
repository files, so all maintenance commands remain scoped correctly after
entering `.dev`.
