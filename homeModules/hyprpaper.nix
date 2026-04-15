{ config, osConfig, ... }:
let
  host = osConfig.networking.hostname;
in
{
	services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/wallpapers/mossy.jpg"
        "~/wallpapers/mossy-l.jpg"
        "~/wallpapers/mossy-r.jpg"
        #"~/wallpapers/forest.jpg"
        # "~/wallpapers/geometric.jpg"
        # "~/wallpapers/west/jpg"
        #"~/wallpapers/west-l/jpg"
        #"~/wallpapers/west-r/jpg"
        # "~/wallpapers/falls.jpg"
        # "~/wallpapers/falls-l.jpg"
        # "~/wallpapers/falls-r.jpg"
				# "~/wallpapers/pass.jpg"
				# "~/wallpapers/pass-l.jpg"
				# "~/wallpapers/pass-r.jpg"
				#"~/wallpapers/bigsur-day-l.png"
				#"~/wallpapers/bigsur-day-r.png"
				#"~/wallpapers/bigsur-night-l.png"
				#"~/wallpapers/bigsur-night-r.png"
        #"~/wallpapers/bigsur-day.jpg"
        #"~/wallpapers/bigsur-night.jpg"
      ];
      splash = false;
      wallpaper = if host == "snowblack" then [
        {
					monitor = "DP-3";
					#path = "~/wallpapers/bigsur-night-l.png";
					path = "./../wallpapers/mossy-l.png";
					fit_mode = "fill";
				}
				{
					monitor = "DP-1";
					#path = "~/wallpapers/bigsur-night-r.png";
					path = "./../wallpapers/mossy-r.png";
					fit_mode = "fill";
				}
			] else [
        {
          monitor = "eDP-1";
          #path = "~/wallpapers/bigsur-night.jpg";
					path = "./../wallpapers/mossy.jpg";
          fit_mode = "fill";
        }
      ];
    };      
	};

	# Force hyprpaper to grab the latest hyprpaper.conf on restart
  systemd.user.services.hyprpaper = {
    Unit.X-Restart-Triggers = [
      "${config.xdg.configFile."hypr/hyprpaper.conf".source}"
    ];
  };
}
