{ config, ... }:
let
  stylixColor = config.lib.stylix.colors;
in
{
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      base16-colors = {
        # inherit (config.lib.stylix.colors.withHashtag)

        inherit (stylixColor) base00;
        inherit (stylixColor) base01;
        inherit (stylixColor) base02;
        inherit (stylixColor) base03;
        inherit (stylixColor) base04;
        inherit (stylixColor) base05;
        inherit (stylixColor) base06;
        inherit (stylixColor) base07;
        inherit (stylixColor) base08;
        inherit (stylixColor) base09;
        inherit (stylixColor) base0A;
        inherit (stylixColor) base0B;
        inherit (stylixColor) base0C;
        inherit (stylixColor) base0D;
        inherit (stylixColor) base0E;
        inherit (stylixColor) base0F;

        # base00 = stylixColor.base00;
        # base01 = stylixColor.base01;
        # base02 = stylixColor.base02;
        # base03 = stylixColor.base03;
        # base04 = stylixColor.base04;
        # base05 = stylixColor.base05;
        # base06 = stylixColor.base06;
        # base07 = stylixColor.base07;
        # base08 = stylixColor.base08;
        # base09 = stylixColor.base09;
        # base0A = stylixColor.base0A;
        # base0B = stylixColor.base0B;
        # base0C = stylixColor.base0C;
        # base0D = stylixColor.base0D;
        # base0E = stylixColor.base0E;
        # base0F = stylixColor.base0F;
      };
    };
  };
}
