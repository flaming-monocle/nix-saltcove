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
  ];
}
