{ config, osConfig, ... }:
let
  host = osConfig.networking.hostName;
in
{
	services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = if host == "snowblack" then [
        {
					monitor = "DP-3";
					# path = "./wallpapers/bigsur-night-l.png";
          path = "/etc/nixos/wallpapers/west-l.png";
					fit_mode = "fill";
				}
				{
					monitor = "DP-1";
					# path = "./wallpapers/bigsur-night-r.png";
					path = "/etc/nixos/wallpapers/west-r.png";
					fit_mode = "fill";
				}
			] else [
        {
          monitor = "eDP-1";
          # path = "./wallpapers/bigsur-night.jpg";
					path = "/etc/nixos/wallpapers/west.jpg";
          fit_mode = "fill";
        }
      ];
    };      
	};
}
