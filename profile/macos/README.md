# macOS Profile

Tart configuration for Apple Silicon macOS hosts: Fedora and macOS guest
initialization, with launch agents for both development guests.

## Definitions

| Guest | Initialization | Launch agent |
| --- | --- | --- |
| Fedora container host | [NoCloud seed](tart/cloud-init/) | [podman-dev.plist](tart/podman-dev.plist) |
| macOS development guest | [Packer template](tart/macos.pkr.hcl) | [macos-dev.plist](tart/macos-dev.plist) |

## Fedora Initialization

Use the official [Fedora Cloud Base](https://fedoraproject.org/cloud/download/)
**Generic aarch64 QEMU qcow2** image for the stable Fedora release shared by the
[execution hosts](../dev-container/README.md#execution-hosts). The initial disk
and cloud-init seed follow [Tart's upstream Linux image workflow](https://github.com/cirruslabs/linux-image-templates).

The macOS host requires Tart, QEMU (`qemu-img`), and cdrtools (`mkisofs`).
Copy `tart/cloud-init/` into a local seed directory and configure account access
in that copy's `user-data` before booting the guest.

Initialize a new `podman-dev` VM on the macOS host:

```bash
qemu-img convert -f qcow2 -O raw /path/to/fedora.qcow2 /path/to/fedora.raw
tart create podman-dev --linux
tart set podman-dev --disk /path/to/fedora.raw
mkisofs -output /path/to/seed.iso -volid cidata -joliet -rock /path/to/seed/
tart run podman-dev --disk /path/to/seed.iso
```

Log in using the configured credentials and wait for `cloud-init status --wait`
to finish, then apply the common
[container host configuration](../dev-container/host/README.md#configuration).
System updates and Fedora release upgrades use the common profile's
[maintenance workflow](../dev-container/host/README.md#maintenance).

## macOS Build

The build requires Packer, Tart with [first-boot provisioning](https://github.com/openai/tart/blob/2.41.1/Sources/tart/Commands/Run.swift)
support (`--provisioning-opts`), and macOS 27 or later on both host and guest.

Build on the macOS host from the repository root, supplying variables in a local
file:

```bash
packer init profile/macos/tart/macos.pkr.hcl
packer build -var-file=/path/to/macos.pkrvars.hcl \
  profile/macos/tart/macos.pkr.hcl
```

Rebuilding the same VM replaces it and its disk. Stop it before rebuilding and
preserve workload data separately.

## Launch Agents

Install the agents in `~/Library/LaunchAgents` and manage VM startup and restart
manually through `launchctl`.
