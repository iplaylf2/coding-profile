# Container Host

Shared configuration for the Fedora Linux execution hosts in the
[development container profile](../README.md).

## Configuration

Run [playbook.yml](playbook.yml) inside the execution host, outside development
containers, as the non-root user who owns the development containers and has
sudo access. From the repository root:

```bash
sudo dnf install ansible-core
ansible-playbook --connection=local --inventory localhost, \
  profile/dev-container/host/playbook.yml
```

Add `--ask-become-pass` when sudo requires a password. Reapply the playbook after
configuration changes. Restart the host after the first application or changes
to the memory policy.

## Remote Podman Access

Configure SSH access for the container user and run `id -u` on the execution
host to obtain that user's UID. Add the connection on the client using the
reachable SSH endpoint:

```text
podman system connection add --default fedora "ssh://<user>@<ssh-endpoint>/run/user/<uid>/podman/podman.sock"
```

Continue with the [VS Code connection settings](../vscode-base/README.md#vs-code-connection)
to attach to a container.

## Maintenance

Update the installed system in place on both platforms:

```bash
sudo dnf upgrade --refresh
```

Restart the execution host when required by updated system components. Use
Fedora's [release upgrade procedure](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/)
for Fedora release upgrades.
