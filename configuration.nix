{ pkgs, ... }:
{
  # -- Universal Settings --

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

  # Home Manager
  home-manager = {
    useUserPackages = true;
    #useGlobalPkgs = true; # Appears to throw an error during rebuild-switch
    backupFileExtension = "backup";
  };
  
  # System Settings
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowInsecure = true;
  nix.settings.auto-optimise-store = true;
  nix.settings.download-buffer-size = 262144000; # 250MB
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.polkit.enable = true;

  # Default Programs
  programs.dconf.enable = true;
  programs.firefox.enable = true;
  environment.variables.EDITOR = "nvim";
  environment.variables.SUDO_EDITOR = "nvim";

	# Garbage Collection
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};

  system.stateVersion = "25.11"; # DO NOT MODIFY
}
