# Development Container Profile

A Fedora container host and a Toolbx development image for rootless Podman and
VS Code.

## Components

- [Container host](host/README.md): provisioning and maintenance for the Fedora
  execution hosts.
- [VS Code base image](vscode-base/README.md): a mutable Toolbx development
  environment for VS Code.

## Execution Hosts

Use the same stable Fedora release on both platforms:

- [macOS](../macos/README.md): Fedora Cloud Base in Tart.
- [Windows](../windows/README.md): the official Fedora WSL distribution.

Both hosts use the same Ansible configuration and DNF maintenance. VS Code runs
on the client and attaches to a Toolbx container through remote Podman.

## Build Context

Build the VS Code base image from this repository's root on the Linux execution
host, outside development containers, as the non-root user who runs Podman and
Toolbx. The checkout must be available on that host.
