{ config, pkgs, lib, ... }:
{
  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };
    
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  nix.settings.experimental-features = "nix-command flakes";

  services.openssh.enable = true;

  system.stateVersion = "25.11"; # DO NOT MODIFY
}
