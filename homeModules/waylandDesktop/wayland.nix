{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wayland
    wayland-protocols
    xwayland
		wl-clipboard
		wl-clip-persist
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Forces Wayland for transparency reasons
  };
}
