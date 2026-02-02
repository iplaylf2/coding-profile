# WSL Profile

NixOS distribution setup for WSL.

## Purpose

Bridges host SSH agent socket for Docker usage. Manages Docker service activation via systemd after WSL initialization completes.

## Operations

Deploy configuration:

```bash
sudo "$(command -v uv)" run contentctl deploy root -p etc
```

Apply NixOS changes:

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos-wsl
```

Adopt changes from system:

```bash
sudo "$(command -v uv)" run contentctl adopt root -p etc
```
