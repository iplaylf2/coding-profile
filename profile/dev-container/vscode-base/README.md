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
on the client and set `dev.containers.dockerPath` to `podman` in VS Code user
settings.

For a remote execution host, configure the client's default Podman connection
through `podman system connection` over SSH to the host user's
[rootless socket](../host/README.md#remote-podman-access). On Linux clients, set
[`CONTAINER_CONNECTION`](https://docs.podman.io/en/latest/markdown/podman.1.html#container-connection)
to that connection's name in the client VS Code process's environment to enable
remote mode.

Attach with **Dev Containers: Attach to Running Container...**, then open
**Dev Containers: Open Container Configuration File**. Set `remoteUser` to the
execution host's username and use `hybrid` port discovery:

```json
{
  "remoteUser": "<execution-host-username>",
  "settings": {
    "remote.autoForwardPortsSource": "hybrid"
  }
}
```

[Toolbx shares the host's network and process namespaces](https://github.com/containers/toolbox/blob/main/src/cmd/create.go#L421).
The [`hybrid` setting](https://github.com/microsoft/vscode/blob/main/src/vs/workbench/contrib/remote/common/remote.contribution.ts)
discovers ports from terminal and debug output, then stops forwarding when the
listening processes exit. This reduces automatic forwarding of unrelated host
services. Services without matching output may need manual forwarding in the
Ports view.

Reconnect after changing `remoteUser`. Project files live in the execution
host's home directory, which Toolbx shares with the container.

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
