# Development Tooling

Repository-local maintenance scripts and tool entrypoints.

## Purpose

This directory contains helpers for checking, formatting, and running repository
tooling without mixing those concerns into the profile directories. The Nix
environment is defined in `.nix`.

## Environment

Start a shell with the repository tools available:

```bash
nix develop path:./.nix
```

From that shell, run checks:

```bash
.dev/scripts/check.sh
```

Format files:

```bash
.dev/scripts/format.sh
```

For a one-off command, run a script through `nix develop -c`:

```bash
nix develop path:./.nix -c .dev/scripts/check.sh
```

## Tool Links

Build stable repository-local tool entrypoints:

```bash
nix build path:./.nix#tools -o .dev/tools
```

Use this when a tool needs a persistent path instead of an activated Nix shell.
