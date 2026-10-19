# macOS Profile

Tart configuration for Apple Silicon macOS hosts: a macOS guest build and
launch agents for macOS and Linux development guests.

## Definitions

| Definition | Role |
| --- | --- |
| [macOS build](tart/macos.pkr.hcl) | Creates and initializes `macos-dev`. |
| [macOS launch agent](tart/macos-dev.plist) | Runs `macos-dev` with suspend support. |
| [Linux launch agent](tart/podman-dev.plist) | Runs an existing `podman-dev` container host without a graphical window. |

## macOS Build

The build uses Apple's latest supported restore image, ASIF with the recovery
partition retained, and Tart's default VM resources. It requires Packer, Tart
with [first-boot provisioning](https://github.com/openai/tart/blob/2.41.1/Sources/tart/Commands/Run.swift)
support (`--provisioning-opts`), and macOS 27 or later on both host and guest.

`bootstrap_password` supplies the guest's `admin` account password and Packer's
SSH credentials. It must be alphanumeric and remains the account password after
the build.

Build on the macOS host from the repository root:

```bash
packer init profile/macos/tart/macos.pkr.hcl
packer build -var-file=/path/to/macos.pkrvars.hcl \
  profile/macos/tart/macos.pkr.hcl
```

Rebuilding the same VM replaces it and its disk. Stop it before rebuilding and
preserve workload data separately.

## Launch Agents

The agents are loaded from `~/Library/LaunchAgents` at user login and call
`/opt/homebrew/bin/tart`. VM startup and restart are controlled manually through
`launchctl`.

Executable paths and VM names must match the host's Tart installation and local
guests. Keep the macOS VM name aligned between the build and launch definitions.
The Linux agent expects a `podman-dev` VM provisioned separately with the
[container host configuration](../dev-container/host/README.md).
