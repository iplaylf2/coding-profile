# Development Container Profile

Image definitions for a Podman and Toolbx development environment with VS Code.

## Components

- [Podman Machine image](podman-machine/README.md): a bootc-compatible Machine
  OS with Toolbx, compressed swap, and systemd-oomd.
- [VS Code base image](vscode-base/README.md): a Fedora-based Toolbx image with
  development tools and a per-container VS Code Server volume.

## Execution Hosts

The Linux execution host runs Podman and Toolbx. VS Code runs on the client and
attaches to a Toolbx container on that host.

| Execution host | Profile integration |
| --- | --- |
| Native Linux | Podman and Toolbx from distribution packages; VS Code base image. |
| Podman Machine on macOS, Linux, or Windows Hyper-V | Machine OS image, then VS Code base image. |
| Existing WSL distribution | Podman and Toolbx from distribution packages; VS Code base image through a VS Code WSL window. |
| Podman Machine with the WSL provider | Toolbx from distribution packages inside the Machine; VS Code base image. |

Podman Machine OS deployment uses
[`podman machine os apply`](https://docs.podman.io/en/latest/markdown/podman-machine-os-apply.1.html),
which supports CoreOS-based Machines. WSL-based Machines use distribution
packages instead of this profile's Machine OS image.

Host prerequisites are covered by the upstream
[Podman](https://podman.io/docs/installation/),
[Toolbx](https://containertoolbx.org/install/), and
[VS Code WSL](https://code.visualstudio.com/docs/remote/wsl) documentation.

## Build Context

Image builds run from this repository's root on the Linux execution host,
outside containers, as the non-root user who runs Podman and Toolbx. The checkout
must be available on that host.

Machine commands use `toolbx-host` as the VM name; substitute an existing
Machine's name where appropriate. From the client, its host shell is available
with `podman machine ssh toolbx-host`.
