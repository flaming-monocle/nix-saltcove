{
  lib,
  osConfig,
  ...
}:
let
  inherit (osConfig.networking) hostName;

  activeWallpaper = {
    left = "mossy-l.png";
    right = "mossy-r.png";
    bifrost = "mossy.jpg";
  };
in
{
  # I'm the only one using Hyprpaper, so no user conditionals here
  # If that changes, the `lib.mkIf`s will go deeper
  services.hyprpaper = {
    enable = true;
    settings = lib.mkMerge [
      {
        splash = false;
        # preload = "./../wallpapers/*";
      }
      (lib.mkIf (hostName == "snowblack") {
        wallpaper = [
          "DP-3, /etc/nixos/wallpapers/${activeWallpaper.left}"
          "DP-1, /etc/nixos/wallpapers/${activeWallpaper.right}"
        ];
      })
      (lib.mkIf (hostName == "bifrost") {
        wallpaper = [
          "eDP-1, /etc/nixos/wallpapers/${activeWallpaper.bifrost}"
        ];
      })
    ];
  };
}
