# stylix/everforest.nix
{ pkgs, inputs, ... }:
{
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix.base16Scheme = {
    system = "base16";
    name = "Everforest Dark Hard";
    author = "Sainnhe Park (https://github.com/sainnhe)";
    variant = "dark";
    palette = {
	  	# 26.04.02: swapped base08 (original: red) and base0D (blue)
	  	base00 = "#272e33"; # Background
	  	base01 = "#2e383c"; # Bar background
	  	base02 = "#414b50"; # Selection background
	  	base03 = "#859289"; # Comments
	  	base04 = "#9da9a0"; # Dark foreground - status bars, mostly
	  	base05 = "#d3c6aa"; # Claret, deliminators, operators
	  	base06 = "#edeada"; # not often used
	  	base07 = "#fffbef"; # not often used
	  	base0D = "#e67e80"; # Errors, variables, markup links, diff deleted
	  	base09 = "#e69875"; # ints, bools, consts, URLs
	  	base0A = "#dbbc7f"; # classes, markup bold, search background
	  	base0B = "#a7c080"; # Verified Bash commands, strings, markup code, diff inserted
	  	base0C = "#83c092"; # support, regex, esc, markup quotes
	  	base08 = "#7fbbb3"; # functions, methods, headings
	  	base0E = "#d699b6"; # Warnings, keywords, storage, markup italic, diff changed
	  	base0F = "#9da9a0"; # depreciated, some embedded tags
    };
  };
}
