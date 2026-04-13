{ config, pkgs, lib, ... }:
{
  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Users
  users.users.kobi = {
    isNormalUser = true;
    description = "Kobi";
    extraGroups = [ "networkmanager" "wheel" ];
    initialPassword = "test";
  };

  environment.systemPackages = with pkgs; [
    cowsay
  ];

  system.stateVersion = "25.11"; # DO NOT MODIFY
}
