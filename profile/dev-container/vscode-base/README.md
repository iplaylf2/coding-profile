# VS Code Base Image

The [Containerfile](Containerfile) defines the Toolbx development image for the
[development container profile](../README.md), with command-line tools,
pnpm-managed Node.js, and uv-managed Python.

Development tools live under `/opt/devtools` and support updates by the Toolbx
user. Each container receives its own VS Code Server volume at
`${DEV_HOME}/.vscode-server`.

## Build

Use the profile's [build context](../README.md#build-context). The build arguments
set the VS Code Server directory's path and initial ownership for that host user:

```bash
podman build \
  --build-arg DEV_HOME="$(realpath "${HOME}")" \
  --build-arg DEV_UID="$(id -u)" \
  --build-arg DEV_GID="$(id -g)" \
  --tag localhost/vscode-base:latest \
  profile/dev-container/vscode-base
```

Add `--pull=always --no-cache` to refresh the base image and installed tools.

## Container

Create the container and enter it once to initialize the Toolbx user:

```bash
toolbox create --image localhost/vscode-base:latest <container-name>
toolbox enter <container-name>
```

## VS Code Connection

Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
on the client and set the Podman CLI in VS Code user settings:

```json
{
  "dev.containers.dockerPath": "podman"
}
```

For Podman Machine, the client's default Podman connection must target the same
non-root VM user used for the build:

```text
podman system connection list
podman system connection default <connection-name>
```

Attach with **Dev Containers: Attach to Running Container...**. In
**Dev Containers: Open Container Configuration File**, set `remoteUser` to the
execution host's username (`id -un` on that host):

```json
{
  "remoteUser": "<execution-host-username>"
}
```

Reconnect after changing `remoteUser`. Project files live in the shared Linux
home.

## Tool Maintenance

Update the development tools installed under `/opt/devtools/<tool>` from inside
the container, without `sudo`:

```bash
pnpm self-update
pnpm runtime set node latest --global
uv self update
```

Image rebuilds refresh the tools installed in new containers. Additional tools
belong in `/opt/devtools/<tool>`, exposed through `PATH` and made writable with
[make-devtool-mutable](make-devtool-mutable).
