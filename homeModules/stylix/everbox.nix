# stylix/everbox.nix
{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix.base16Scheme = {
		system = "base16";
		name = "Everbox Dark";
		author = "Kobi O'Reilly (https://github.com/flaming-monocle)";
		# Credits: 
		#	https://github.com/nordtheme/nord
		# https://github.com/sainnhe/everforest
		# https://github.com/sainnhe/gruvbox-material
		variant = "dark";

		palette = {
			base00 = "#1E2326"; # Background
			base01 = "#272E33"; # Bar background
			base02 = "#414B50"; # Selection background
			base03 = "#596971"; # Comments
			base04 = "#DDC7A1"; # Dark foreground - status bars, mostly
			base05 = "#E9E8DA"; # Claret, deliminators, operators
			base06 = "#384B55"; # not often used
			base07 = "#1E2326"; # not often used
			base08 = "#E57E80"; # Errors, variables, markup links, diff deleted
			base09 = "#6C95C7"; # ints, bools, consts, URLs
			base0A = "#DABC7F"; # classes, markup bold, search background
			base0B = "#89B482"; # Verified Bash commands, strings, markup code, diff inserted
			base0C = "#A7C080"; # support, regex, esc, markup quotes
			base0D = "#8FBCBB"; # functions, methods, headings
			base0E = "#E78A4E"; # Warnings, keywords, storage, markup italic, diff changed
			base0F = "#E9E8DA"; # depreciated, some embedded tags
		};
	};
  
}
