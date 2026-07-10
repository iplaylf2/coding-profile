# Toolbx Images Profile

OCI image definitions for personal Fedora Toolbx development containers.

## Structure

Each child directory is a self-contained OCI image build context.

The build contexts are consumed directly from this checkout rather than
synchronized to another workspace, so this profile does not use
`content-hub.yaml`.

- `workspace-base`: baseline command-line tools and language runtimes for general
  coding work.

## Operations

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

Create and enter a Toolbx container from the image:

```bash
toolbox create --image localhost/workspace-base:latest <container-name>
toolbox enter <container-name>
```

Rebuilding the image does not update existing containers. Test the rebuilt image
under a new container name. To reuse an existing name, first preserve any
container-local state and exit the container, then replace it:

```bash
toolbox rm <container-name>
toolbox create --image localhost/workspace-base:latest <container-name>
```

## Version Policy

The current definition uses floating inputs: `uv:latest`,
`fedora-toolbox:latest`, Node.js `lts`, and an unversioned uv-managed Python.
A full refresh can therefore change versions without a profile edit, and the
image's Fedora release can differ from the Fedora WSL host. Validate a new
container before replacing an existing one.
