{
  pkgs,
  stateVersion,
  username,
  ...
}:

{
  system.stateVersion = stateVersion;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  wsl.enable = true;
  wsl.defaultUser = username;
  wsl.docker-desktop.enable = true;
}
