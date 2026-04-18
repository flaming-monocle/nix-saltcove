# stylix.nix
{ config, pkgs, lib, inputs, ... }:
{
	imports = [
    inputs.stylix.homeModules.stylix
    ./apollo.nix
    #./everforest.nix
    #./everbox.nix
	];
  stylix = {		
    enable = true;
		targets = {
			starship.enable = false;
    };

		opacity = {
			terminal = 0.5;
		};

		fonts = {
			serif = {
				package = pkgs.dejavu_fonts;
				name = "DejaVu Serif";
			};
			sansSerif = {
				package = pkgs.dejavu_fonts;
				name = "DejaVu Sans";
			};
			monospace = {
				package = pkgs.dejavu_fonts;
				name = "JetBrains Mono";
			};
			emoji = {
				package = pkgs.twitter-color-emoji;
				name = "Twitter Color Emoji";
      };
		};
  };
  
	gtk.gtk4.theme = null;
}
