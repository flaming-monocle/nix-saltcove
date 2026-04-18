{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
    xwayland
    wl-clipboard
    wl-clip-persist
    wayland-utils
  ];

  # Hyprland dependencies
  programs.hyprland.enable = true;
  services.gvfs.enable = true;
  # services.hyprpolkit.enable = true;
  
  # KDE Plasma dependencies
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
  };
}
