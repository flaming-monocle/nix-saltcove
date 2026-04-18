{ config, pkgs, lib, ... }:
{
  fonts.packages = with pkgs; [
    font-awesome_4 # For nixos/homeModules/waybar.nix
  ];
}
