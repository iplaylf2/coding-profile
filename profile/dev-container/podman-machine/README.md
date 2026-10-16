# Podman Machine Image

The [Containerfile](Containerfile) adds Toolbx to the official
`quay.io/podman/machine-os` image for a bootc-compatible Podman Machine.
Create the VM using the [setup instructions](../README.md#podman-machine).

## Build

From the client, connect with `podman machine ssh toolbx-host`. Make a checkout
of this repository available in the VM, then run from its root as a non-root
user, outside a container.

```bash
machine_image="localhost/podman-machine-toolbox:$(date +%Y%m%d-%H%M%S)"
podman build \
  --pull=always \
  --no-cache \
  --tag "$machine_image" \
  profile/dev-container/podman-machine

machine_store=$(podman info --format '{{.Store.GraphRoot}}')
printf 'containers-storage:[%s]%s\n' "$machine_store" "$machine_image"
```

Save the printed image URI for deployment.

## Deploy

Return to the client machine. Replace `<printed-image-uri>` with the URI from
the build and use your Machine's name if it differs from `toolbx-host`:

```bash
podman machine os apply --restart '<printed-image-uri>' toolbx-host
```

After startup, inspect the deployment and Toolbx:

```bash
podman machine ssh toolbx-host 'sudo bootc status; toolbox --version'
```

## Update and Roll Back

Rebuild and deploy the image to update the Machine OS and Toolbx.

To stage the previous system deployment, run from the client:

```bash
podman machine ssh toolbx-host 'sudo bootc rollback'
podman machine stop toolbx-host
podman machine start toolbx-host
```
