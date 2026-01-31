{
  userName,
  ...
}:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  wsl.enable = true;
  wsl.defaultUser = userName;
  wsl.docker-desktop.enable = true;
}
