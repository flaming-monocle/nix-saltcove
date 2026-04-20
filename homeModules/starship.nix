{ config, lib, ... }:
let
  bg = config.lib.stylix.colors.base01;
  fg = config.lib.stylix.colors.base05;
  inherit (lib) strings;
  user = config.home.username;
  promptBar = 
    if user == "kobi" then " └──── "
    else if user == "carlisle" then " └───── "
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
        "[░▒▓](fg:#${bg})[   ${user} ](fg:#${fg} bg:#${bg})[](fg:#${bg})"
        "$directory"
        "$git_branch"
        "$git_status"
        "$time"
        "$line_break"
        "[░▒▓](fg:#${bg})[${promptBar}% ](fg:#${fg} bg:#${bg})[ ](fg:#${bg})"
      ];
      
      directory = {
        style = "fg:#${fg}";
				truncation_length = 3;
				truncation_symbol = "…/";
				format = "[ $path]($style)";
      };
      
      git_branch = {
        symbol = "";
				style = "fg:#${fg}";
				format = "[  $symbol $branch]($style)";
      };

      git_status = {
        style = "fg:#${fg}";
				format = "[ (ahead_behind)]($style)";
      };

      time = {
        disabled = false;
				time_format = "%R";
				style = "fg:#${fg}";
				format = "[ $time]($style)";
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
