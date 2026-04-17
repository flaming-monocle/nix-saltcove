{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
    xwayland
    wl-clipboard
    wl-clip-persist
  ];
}
