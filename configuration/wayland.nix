{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
    xwayland
    wl-clipboard
    wl-clip-persist
  ];

  programs.hyprland.enable = true;
  programs.hyprpolkit.enable = true;
  
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    };
  };
}
