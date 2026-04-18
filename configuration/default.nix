{ pkgs, ... }:
{
  # -- Universal Settings --
  imports = [
    ./wayland.nix
    ./nvf/default.nix
    ./fonts.nix
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    linux-firmware
    dconf-editor
    clang
    vim
    git
  ];
  
  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Locale
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  # System Settings
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowInsecure = true;
  nix.settings.auto-optimise-store = true;
  nix.settings.download-buffer-size = 262144000; # 250MB
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.polkit.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Forces Wayland for transparency reasons 

  # Default Programs
  programs.dconf.enable = true;
  programs.firefox.enable = true;
  environment.variables.EDITOR = "nvim";
  environment.variables.SUDO_EDITOR = "nvim";

  # Fonts
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
    ];
  };

	# Garbage Collection
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};

  system.stateVersion = "25.11"; # DO NOT MODIFY
}
