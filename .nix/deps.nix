{ pkgs }:
{
  packages = with pkgs; [
    cspell
    nixfmt-tree
    oxfmt
    python314
    uv
  ];
}
