{ pkgs, ... }:
{
  # Settings apply to all users in host
  imports = [
    # System Base
    ./bifrost-hardware.nix
    ./../configuration/default.nix

    # User Settings
    ./../users/kobi.nix

    # Extra Host-Wide Configs
  ];

  home-manager.users.kobi = {
    # Host- AND user-specific settings
  };
  
  # Hostname
  networking.hostName = "bifrost";

  # Boot options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  hardware.bluetooth.enable = true;
}
