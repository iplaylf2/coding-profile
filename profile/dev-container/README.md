# Development Container Profile

Podman and Toolbx setup with a Fedora-based development image for VS Code.

## Prepare the Linux Execution Host

### Native Linux

Install Podman and [Toolbx](https://containertoolbx.org/install/) using the
distribution's packages. On Fedora:

```bash
sudo dnf install podman toolbox
```

### Podman Machine

Use this path on macOS, Linux, or Windows with Hyper-V. Install
[Podman](https://podman.io/docs/installation/) on the client and create a
Machine named `toolbx-host`:

```text
podman machine init toolbx-host
```

On Windows, use this initialization command to select Hyper-V:

```text
podman machine init --provider hyperv toolbx-host
```

Start the Machine:

```text
podman machine start toolbx-host
```

For an existing Machine, skip initialization and use its name throughout.
Build and deploy the [Podman Machine image](podman-machine/README.md) to install
Toolbx.

### WSL

#### Existing WSL Distribution

Open a shell in the distribution and install Podman and Toolbx using its
packages. On Fedora WSL:

```bash
sudo dnf install podman toolbox
```

Open the project through VS Code's [WSL extension](https://code.visualstudio.com/docs/remote/wsl)
before attaching to the Toolbx container.

#### Podman Machine with the WSL Provider

Install [Podman](https://podman.io/docs/installation/) on Windows, then create
and enter a WSL-backed Machine:

```text
podman machine init --provider wsl toolbx-host
podman machine start toolbx-host
podman machine ssh toolbx-host
```

For an existing Machine, connect using its name. Inside the VM, install Toolbx
and return to the client:

```bash
sudo dnf install toolbox
exit
```

## Create the VS Code Container

Follow the [VS Code base image instructions](vscode-base/README.md) to build
the image, create a Toolbx container, and attach VS Code.
