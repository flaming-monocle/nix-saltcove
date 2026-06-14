{
  config,
  lib,
  ...
}:
let
  bg = config.lib.stylix.colors.base02;
  fg = config.lib.stylix.colors.base05;
  inherit (config.home) username;
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      # ░▒▓  user /etc/nixos  git  nixshell
      # ░▒▓ └─── % input
      format = lib.strings.concatStrings [
        "[░▒▓](fg:#${bg})"
        "${username}(fg:#${fg} bg:#${bg})"
        "[ ](fg:#${bg})"
        #"[ on ](fg:#${fg})"
        "$hostname"
        #"[ in ](fg:#${fg})"
        "$directory"
        "$git_branch"
        "$git_status"
        "$line_break"
        "[░▒▓](fg:#${bg})"
        "[└─ ](fg:#${fg} bg:#${bg})"
        "[ ](fg:#${bg})"
      ];
      right_format = "$time$line_break";

      # An old format that makes a perfect chevron, but not automatically
      # TODO Doesn't currently work
      # (mkIf (config.home.username == "kobi") "[└── ](fg:#${fg} bg:#${bg})")
      # (mkIf (config.home.username == "tui") "[└─ ](fg:#${fg} bg:#${bg})")
      # (mkIf (config.home.username == "carlisle") "[└────── ](fg:#${fg} bg:#${bg})")

      username = {
        show_always = true;
        style_user = "fg:#${fg} bg:#${bg}";
        format = "[$user]($style_user)";
      };

      hostname = {
        ssh_only = false;
        # format = "[$hostname]";
      };

      directory = {
        style = "fg:#${fg}";
        truncation_length = 3;
        truncation_symbol = "…/";
        format = "[$path]($style)";
      };

      git_branch = {
        symbol = "";
        style = "fg:#${fg}";
        format = "[ | $symbol $branch]($style)";
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
