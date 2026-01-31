{ pkgs, ... }:

let
  params = import ./params.nix;

  inherit (params)
    username
    ;
in
{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    uv
    python314
  ];
}
