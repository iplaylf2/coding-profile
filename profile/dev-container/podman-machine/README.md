# Podman Machine Image

The [Containerfile](Containerfile) extends `quay.io/podman/machine-os` with Toolbx,
compressed swap, and systemd-oomd for the
[development container profile](../README.md).

## Memory Policy

- [zram-generator.conf](zram-generator.conf) enables compressed swap with the
  generator's default sizing and the kernel's default compression algorithm.
- [50-oomd.conf](user.slice.d/50-oomd.conf) enables systemd-oomd memory-pressure
  actions on each user manager's `user.slice`, using systemd's default thresholds.
  Sustained pressure can cause workload termination.

The oomd policy covers containers and other processes beneath that slice.
Rootful containers and workloads in other slices fall outside its coverage.

The image owns these defaults under `/usr/lib/systemd`; machine-local `/etc`
configuration and user-local systemd overrides remain independent of image
updates.

## Build

Build inside the Machine VM using the profile's
[build context](../README.md#build-context):

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

On the client, apply the printed image URI:

```bash
podman machine os apply --restart '<printed-image-uri>' toolbx-host
```

After startup, inspect the deployment and Toolbx:

```bash
podman machine ssh toolbx-host 'sudo bootc status; toolbox --version'
```

Rebuild and deploy to update the Machine OS, Toolbx, and profile defaults.

## Roll Back

From the client, stage the previous system deployment and restart the VM:

```bash
podman machine ssh toolbx-host 'sudo bootc rollback'
podman machine stop toolbx-host
podman machine start toolbx-host
```
