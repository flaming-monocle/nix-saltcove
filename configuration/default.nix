{ pkgs, ... }:
{
  # -- Universal Settings --

  imports = [
    ./wayland.nix
    ./nvf/default.nix
    ./fonts.nix
    ./gaming.nix
  ];

  # Packages
  environment = {
    systemPackages = with pkgs; [
      linux-firmware
      dconf-editor
      clang
      vim
      git
      direnv
      spotify
    ];

    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
    sessionVariables.NIXOS_OZONE_WL = "1"; # Forces Wayland for transparency
    variables.EDITOR = "nvim";
    variables.SUDO_EDITOR = "nvim";
  };

  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  nix.settings = {
    auto-optimise-store = true;
    download-buffer-size = 262144000; # 250MB
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  security.polkit.enable = true;

  # Default Programs
  programs.dconf.enable = true;
  programs.firefox.enable = true;

  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings.LC_TIME = "en_DK.UTF-8";

  system.stateVersion = "25.11"; # DO NOT MODIFY
}
