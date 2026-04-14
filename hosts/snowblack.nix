{ pkgs, ... }:
{
  # Settings apply to all users in host
  imports = [ 
    # System Base
    ./snowblack-hardware.nix
    ./../configuration.nix

    # User Settings
    ./../users/kobi.nix
    ./../users/carlisle.nix

    # Extra Host-Wide Configs
  ];

  home-manager.users.kobi = {
    # Host- AND user-specific settings
  };
  home-manager.users.carlisle = {
    # Host- AND user-specific settings
  };

  # Hostname
  networking.hostName = "snowblack";

  # Boot options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
