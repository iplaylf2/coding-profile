{ pkgs, ... }:

{
  imports = ./home.nix;

  home.packages = with pkgs; [
    git
    uv
  ];
}
