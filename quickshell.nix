# home-manager module
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    quickshell
  ];
}

