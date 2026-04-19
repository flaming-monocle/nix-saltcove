{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
    xwayland
    wl-clipboard
    wl-clip-persist
    wayland-utils

    libnotify
    hyprland
#   hyprpolkitagent
  ];

  # Hyprland dependencies
  programs.hyprland.enable = true;
  services.gvfs.enable = true;
  
  # KDE Plasma dependencies
  services = {
    desktopManager.plasma6.enable = true;
  #   displayManager = {
  #     sddm = {
  #       enable = true;
  #       wayland.enable = true;
  #     };
  #   };
  };
  # 
  # # Hopefully unfuck SDDM
  # services.fprintd.enable = false;
  # security.pam.services.login.fprintAuth = false;
}
