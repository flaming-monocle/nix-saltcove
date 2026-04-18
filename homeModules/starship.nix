{ config, lib, ... }:
let
  bg = config.lib.stylix.colors.base01;
  fg = config.lib.stylix.colors.base06;
  inherit (lib) strings;
  user = config.home.username;
  promptBar = 
    if user == "kobi" then "└─── "
    else if user == "carlisle" then "└───────"
    else "starshipError";
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      # ░▒▓  user /etc/nixos  git  nixshell
      # ░▒▓ └─── % input
      format = strings.concatStrings [
        "[░▒▓](fg:${bg})[  ](fg:${fg} bg:${bg})${user}[ ](fg:${bg})"
        "$directory"
        "$git_branch"
        "$git_status"
        "$c"
        "$cpp"
        "$rust"
        "$nodejs"
        "$python"
        "$time"
        "$line_break"
        "[░▒▓](fg:${bg})[ ${promptBar} % ](fg:${fg} bg:${bg})[](fg:${bg})"
        "$character"
      ];
        
      username = {
        show_always = true;
        style_root = "fg:${bg} bg:${fg}";
        style_user = "fg:${fg} bg:${bg}";
        format = "[$user ]($style)";
      };
      
      directory = {
        style = "fg = fg0";
				truncation_length = 3;
				truncation_symbol = "…/";
				format = "[$path]($style)";
      };
      
      git_branch = {
        symbol = "";
				style = "fg = fg0";
				format = "[  ](fg0)[$symbol $branch]($style)";
      };

      git_status = {
        style = "fg = fg0";
				format = "[  ](fg0)[(ahead_behind)]($style)";
      };

      nodejs = {
        symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      c = {
        symbol = " ";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      cpp = {
        symbol = " ";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      rust = {
        symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      golang = {
        symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };
      
      php = {
        symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      python = {
        symbol = "";
				style = "bg:color_blue";
				format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      time = {
        disabled = false;
				time_format = "%R";
				style = "fg = fg0";
				format = "[  ](fg0)[$time]($style)";
      };

      character = {
        success_symbol = "";
				error_symbol = "";
      };

			#palette = "everforest";
			#palettes.everforest = {
			#	bg_dim = "#232a2e";
			#	bg0 = "#2d353b";
			#	bg1 = "#343f44";
			#	bg2 = "#3d484d";
			#	bg3 = "#475258";
			#	bg4 = "#4f585e";
			#	bg5 = "#56635f";
			#	bg_green = "#425047";
			#	fg0 = "#d3c6aa";
			#	statusline3 = "#e67e80";
      #};
    };
  };		
}
