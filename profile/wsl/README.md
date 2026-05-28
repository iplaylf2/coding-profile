# WSL Profile

NixOS-on-WSL system configuration.

## Purpose

This profile manages NixOS-on-WSL system configuration, including WSL setup,
host SSH agent socket bridging for Docker, and systemd service activation after
WSL initialization.

Sync rules live in `content-hub.yaml`. The commands below operate on the `/etc`
portion of the root filesystem.

## Operations

Deploy the NixOS configuration files:

```bash
sudo "$(command -v uv)" run contentctl deploy root -p etc
```

Apply the deployed NixOS configuration:

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos-wsl
```

Adopt changes from `/etc/nixos` back into this profile:

```bash
sudo "$(command -v uv)" run contentctl adopt root -p etc
```
