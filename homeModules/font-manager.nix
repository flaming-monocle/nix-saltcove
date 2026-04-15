{ pkgs, ... }:
{
  home.packages = with pkgs; [
    font-manager
  ];
}
