{ config, pkgs, lib, ... }:
let
  colors = config.lib.stylix.colors;
in
{  
  programs.nixvim.colorschemes.base16 = {
    enable = true;
    # Custom swapped palette for Apollo.nix
    palette = lib.mkForce {
      # Swaps:
        # variables (base08) to lightblue (base0C)
        # regex (base0C) to red (base08)
        # embedded tags (base0F) to tan (base0E)
        # nvim frame (base0?) darker
      base00 = "#${colors.base00}";
      base01 = "#${colors.base00}";
      base02 = "#${colors.base01}";
      base03 = "#${colors.base02}";
      base04 = "#${colors.base04}";
      base05 = "#${colors.base05}";
      base06 = "#${colors.base06}";
      base07 = "#${colors.base07}";
      base08 = "#${colors.base0C}";
      base09 = "#${colors.base09}";
      base0A = "#${colors.base0A}";
      base0B = "#${colors.base0B}";
      base0C = "#${colors.base0A}";
      base0D = "#${colors.base0D}";
      base0E = "#${colors.base0E}";
      base0F = "#${colors.base0E}";
    };
  };
}
