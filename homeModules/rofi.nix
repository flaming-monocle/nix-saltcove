{ pkgs, ... }:
{
	programs.rofi = {
    enable = true;
#    theme = "everforest";
#    font = "sans-serif";
    package = pkgs.rofi;
    modes = [
      "drun"
      "run"
      "window"
    ];
    extraConfig = {
      show-icons = true;
    };
  };
}
