# VS Code Base Image

The [Containerfile](Containerfile) provides command-line tools, pnpm-managed
Node.js, uv-managed Python, and a per-container VS Code Server volume.

Prepare Podman and Toolbx using the [setup instructions](../README.md).

## Build

For Podman Machine, connect from the client with `podman machine ssh toolbx-host`.
Make this repository's checkout available on the Linux execution host and run
from its root, outside Toolbx. Use the same non-root user for Podman and Toolbx.

```bash
podman build \
  --build-arg DEV_HOME="$(realpath "${HOME}")" \
  --build-arg DEV_UID="$(id -u)" \
  --build-arg DEV_GID="$(id -g)" \
  --tag localhost/vscode-base:latest \
  profile/dev-container/vscode-base
```

Add `--pull=always --no-cache` to refresh the base image and installed tools.

## Create a Container

Create and enter a Toolbx container from the image:

```bash
toolbox create --image localhost/vscode-base:latest <container-name>
toolbox enter <container-name>
```

## Connect with VS Code

Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
on the client and set the Podman CLI in VS Code user settings:

```json
{
  "dev.containers.dockerPath": "podman"
}
```

On the client, select the VM user's Podman connection when using Podman Machine:

```text
podman system connection list
podman system connection default <connection-name>
```

Confirm that `podman ps` lists the Toolbx container in VS Code's terminal.

After entering the Toolbx container at least once, run **Dev Containers: Attach
to Running Container...** in VS Code and select it. Then run **Dev Containers:
Open Container Configuration File** and set `remoteUser` to the execution
host's username (`id -un` on that host):

```json
{
  "remoteUser": "<execution-host-username>"
}
```

Save the configuration, disconnect, and attach again. Open the project directory
in the shared Linux home.

## Maintain

### Update Development Tools

Update the development tools installed under `/opt/devtools/<tool>` from inside
the container, without `sudo`:

```bash
pnpm self-update
pnpm runtime set node latest --global
uv self update
```

Rebuild the image to refresh the tools installed in new containers.

### Extend the Image

Install each upgradable SDK or tool in its own `/opt/devtools/<tool>` directory,
expose its commands through `PATH`, and finish its installation layer with:

```dockerfile
RUN install-sdk ... \
    && make-devtool-mutable /opt/devtools/<tool>
```
