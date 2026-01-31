{
  pkgs,
  username,
  ...
}:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  wsl.enable = true;
  wsl.defaultUser = username;
  wsl.docker-desktop.enable = true;
}
