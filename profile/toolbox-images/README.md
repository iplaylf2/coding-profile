# Toolbx Images Profile

OCI image definitions for personal Fedora Toolbx development containers.

## Structure

Each child directory is a self-contained OCI image build context.

The build contexts are consumed directly from this checkout rather than
synchronized to another workspace, so this profile does not use
`content-hub.yaml`.

- `workspace-base`: baseline command-line tools and language runtimes for general
  coding work.

## Build

Run these commands from the repository root on the Fedora WSL host, outside any
Toolbx container. Run Podman and Toolbx as the same non-root user; do not use
`sudo`, because Toolbx reads that user's rootless image store.

Build the base workspace image, reusing cached layers when possible:

```bash
podman build --tag localhost/workspace-base:latest profile/toolbox-images/workspace-base
```

To refresh every floating upstream input, rebuild without the cache:

```bash
podman build \
  --pull=always \
  --no-cache \
  --tag localhost/workspace-base:latest \
  profile/toolbox-images/workspace-base
```

## Create a Container

Create and enter a Toolbx container from the image:

```bash
toolbox create --image localhost/workspace-base:latest <container-name>
toolbox enter <container-name>
```

### Replace an Existing Container

Rebuilding the image does not update existing containers. Test a rebuilt image
under a new container name. To reuse an existing name, preserve any
container-local state, exit the container, and then replace it:

```bash
toolbox rm <container-name>
toolbox create --image localhost/workspace-base:latest <container-name>
```

## Upgrade Development Tools

Development tools intended for in-place upgrades live under
`/opt/devtools/<tool>` in the container root filesystem, not in the home
directory shared by Toolbx containers. The Toolbx user can therefore update
them without `sudo`; an update affects only the current container.

For example:

```bash
pnpm self-update
pnpm runtime set node latest --global
uv self update
```

These updates do not change the source image. Rebuild the image when the updated
versions should become defaults for newly created containers.

## Extend the Image

Install each upgradable SDK or tool in its own `/opt/devtools/<tool>` directory,
expose its commands through `PATH`, and finish its installation layer with:

```dockerfile
RUN install-sdk ... \
    && make-devtool-mutable /opt/devtools/<tool>
```

`make-devtool-mutable` grants the `wheel` group recursive write access without
assuming a user ID. It is the shared integration point for future SDK layers;
tool-specific installation and update behavior stays in the tool's build layer
or adapter. The `uv-launcher` script is one such adapter: it supplies uv's
image-level installer metadata only to `uv self update`, leaving normal user
configuration unchanged.

## Version Policy

The current definition uses floating inputs: `fedora-toolbox:latest`, the latest
uv and pnpm standalone installers, Node.js `latest`, and an unversioned
uv-managed Python. A full refresh can therefore change versions without a
profile edit, and the image's Fedora release can differ from the Fedora WSL
host. Validate a new container before replacing an existing one.
