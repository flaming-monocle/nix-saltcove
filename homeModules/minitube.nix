{ pkgs, ... }:
{
  home.packages = with pkgs; [
    minitube
  ];
}
