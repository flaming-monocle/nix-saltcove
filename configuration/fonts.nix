{ config, pkgs, lib, ... }:
{
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome_4 # For nixos/homeModules/waybar.nix
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
    ];
  };
}
