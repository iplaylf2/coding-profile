# macOS Profile

Development configuration for macOS. The [Tart definitions](tart/) build and
launch development guests on Apple Silicon hosts.

## Tart

| Definition | Configuration |
| --- | --- |
| [macOS build](tart/macos.pkr.hcl) | Packer build from an Apple IPSW; unattended setup with SSH enabled; ASIF disk with its recovery partition retained. |
| [Linux launch agent](tart/podman-dev.plist) | Headless `podman-dev` guest for the [development container profile](../dev-container/README.md). |
| [macOS launch agent](tart/macos-dev.plist) | Suspendable `macos-dev` guest for macOS workloads. |

Both launch agents call the Homebrew Tart executable directly. They leave
startup and restart under manual control. The Linux launch agent expects an
existing `podman-dev` VM provisioned with the
[container host configuration](../dev-container/host/README.md).

The macOS build uses Tart's
[first-boot provisioning](https://github.com/openai/tart/blob/2.41.1/Sources/tart/Commands/Run.swift#L269),
which requires macOS 27 or later on both host and guest.

## Build Inputs

Packer variables select the IPSW, VM name, CPU, memory, and disk capacity. The
defaults describe a `macos-dev` guest with 4 CPUs, 8 GiB of memory, and a 160 GB
disk; `latest` follows Apple's latest supported restore image.

`bootstrap_password` supplies the guest's `admin` account password and Packer's
SSH credentials. It remains the account password after provisioning. Use an
alphanumeric value for compatibility with the
[pinned Tart plugin's shutdown command](https://github.com/cirruslabs/packer-plugin-tart/blob/v1.21.0/builder/tart/step_run.go#L145).

## Build And Maintenance

Run Packer on the macOS host from the repository root:

```bash
packer init profile/macos/tart/macos.pkr.hcl
packer build -var-file=/path/to/macos.pkrvars.hcl \
  profile/macos/tart/macos.pkr.hcl
```

Packer produces the working macOS VM. Rebuilding with the same `vm_name`
replaces that VM and its disk; stop the VM before rebuilding and preserve
workload data separately. Record resolved OS releases with retained VM artifacts.

Install the launch agents in `~/Library/LaunchAgents` and manage them with
`launchctl`. Their executable paths must match the Tart installation, and their
VM names must match existing guests. When overriding Packer's `vm_name`, update
the macOS launch agent's VM name as well.
