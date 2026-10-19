# Container Host

Fedora CoreOS `stable` configuration for the Linux execution host in the
[development container profile](../README.md). The upstream OS supplies Podman,
Toolbx, zram-generator, and systemd-oomd.

## Configuration

[config.bu](config.bu) defines the memory policy installed under `/etc/systemd`:

- [zram-generator.conf](zram-generator.conf) enables compressed swap with the
  generator's default sizing and the kernel's default compression algorithm.
- [50-oomd.conf](user.slice.d/50-oomd.conf) enables systemd-oomd memory-pressure
  actions on each user manager's `user.slice`, using systemd's default thresholds.
  Sustained pressure can terminate containers and other workloads beneath that
  slice. Rootful containers and workloads in other slices fall outside its
  coverage.

The system-level `systemd-oomd.service` is enabled explicitly. These choices
extend the [upstream FCOS swap configuration](https://docs.fedoraproject.org/en-US/fedora-coreos/sysconfig-configure-swaponzram/).

## Provisioning

Compile the memory policy with Butane from the repository root:

```bash
butane --strict --pretty \
  --files-dir profile/dev-container/host \
  profile/dev-container/host/config.bu > /path/to/memory-policy.ign
```

Include the generated Ignition configuration in the host's provisioning
configuration alongside its account and SSH access settings.

## Remote Podman Access

Remote clients connect over SSH to the execution host user's rootless Podman
socket. Enable the socket and keep the user manager running after logout by
running these commands on the host as the non-root user who owns the
development containers:

```bash
systemctl --user enable --now podman.socket
sudo loginctl enable-linger "$(id -un)"
```

The client's Podman connection targets `/run/user/<uid>/podman/podman.sock`,
using `id -u` on that host to obtain the UID. Continue with the
[VS Code connection settings](../vscode-base/README.md#vs-code-connection) to
attach to a container.

## Maintenance

Keep FCOS on its upstream
[automatic update mechanism](https://docs.fedoraproject.org/en-US/fedora-coreos/auto-updates/).
Zincati manages OS updates and reboots. Ignition applies the compiled
configuration at first boot; later source changes require provisioning a new
host or updating the corresponding files on the existing host.
