{
  pkgs,
  userName,
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
  wsl.defaultUser = userName;
  wsl.docker-desktop.enable = true;
}
