# Development Container Profile

Host configuration and a Toolbx development image for rootless Podman and
VS Code.

## Components

- [Container host](host/README.md): memory policy and remote Podman access for
  the Linux execution host.
- [VS Code base image](vscode-base/README.md): a Fedora-based Toolbx image with
  development tools and a per-container VS Code Server volume.

## Execution Hosts

The Linux execution host runs rootless Podman and Toolbx. VS Code runs on the
client and attaches to a Toolbx container. The host configuration targets Fedora
CoreOS; an existing Linux or WSL host with Podman and Toolbx can also run the
development image.

For Tart launch agents on Apple Silicon, see the
[macOS profile](../macos/README.md).

## Build Context

Build the VS Code base image from this repository's root on the Linux execution
host, outside development containers, as the non-root user who runs Podman and
Toolbx. The checkout must be available on that host.
