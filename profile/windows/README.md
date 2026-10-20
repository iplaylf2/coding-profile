# Windows Profile

A Fedora WSL execution host for rootless Podman and Toolbx, with native Windows
Podman and VS Code clients.

## Execution Host

Use WSL 2 with systemd enabled. Install the official
[Fedora WSL distribution](https://fedoraproject.org/misc/), replacing `<release>`
with the stable Fedora release shared by the [execution hosts](../dev-container/README.md#execution-hosts):

```powershell
wsl --install "FedoraLinux-<release>"
wsl --distribution "FedoraLinux-<release>"
```

Apply the shared [host configuration](../dev-container/host/README.md#configuration)
inside Fedora, as the regular user who will run Podman and Toolbx. Its
[maintenance workflow](../dev-container/host/README.md#maintenance) also applies
to this host.

## Windows Client

Install the native Windows Podman client, configure SSH access to the Fedora
user account, and add the shared
[remote Podman connection](../dev-container/host/README.md#remote-podman-access).

The Windows client reaches WSL services through
[localhost](https://learn.microsoft.com/windows/wsl/networking#accessing-linux-networking-apps-from-windows-localhost).
Start the Fedora distribution with `wsl --distribution` before using the Windows
client connection. Restart the execution host with
`wsl --terminate "FedoraLinux-<release>"`, then start it again.

VS Code uses this default connection through the native Podman client. Follow the
shared [VS Code connection configuration](../dev-container/vscode-base/README.md#vs-code-connection)
to attach to a running development container.
