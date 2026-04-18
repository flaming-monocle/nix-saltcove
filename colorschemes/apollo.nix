# Just the colors - any application specifics are handled through Stylix (default) or in a config file with mkForce, mkDefault, or mkOverride
{ lib, ... }:
{
  options.custom.colorscheme.apollo = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    description = "NASA palette";
    default = {};
  };

  # For visual reference:
  # bg00 = "#34302C";
  # bg01 = "#53514B";
  # bg02 = "#747168";
  # bg03 = "#8F8B81";
  # bg04 = "#A8A093";
  # bg05 = "#D8CDBD";
  # bg06 = "#E4DAC8";
  # bg07 = "#FBEFDD";
  # fg00 = "#CB4D3B"; # red
  # fg01 = "#CD804A"; # orange
  # fg02 = "#CBA34E"; # yellow
  # fg03 = "#AAA95A"; # green
  # fg04 = "#9BB5AB"; # lightblue
  # fg05 = "#7F8CC9"; # darkblue
  # fg06 = "#DDAA77"; # tan
  # fg07 = "#965CA4"; # purple
  # bg08 = "#3E2D2C"; # dark red
  # bg09 = "#3E322D"; # dark orange
  # bg10 = "#3E372D"; # dark yellow
  # bg11 = "#323226"; # dark green
  # bg12 = "#323634"; # dark lightblue
  # bg13 = "#30333D"; # dark darkblue
  # bg14 = "#443C35"; # dark tan
  # bg15 = "#2E2530"; # dark purple
  
  config.custom.colorscheme.apollo = {
    bg00 = "34302C";
    bg01 = "53514B";
    bg02 = "747168";
    bg03 = "8F8B81";
    bg04 = "A8A093";
    bg05 = "D8CDBD";
    bg06 = "E4DAC8";
    bg07 = "FBEFDD";
    fg00 = "CB4D3B"; # red
    fg01 = "CD804A"; # orange
    fg02 = "CBA34E"; # yellow
    fg03 = "AAA95A"; # green
    fg04 = "9BB5AB"; # lightblue
    fg05 = "7F8CC9"; # darkblue
    fg06 = "DDAA77"; # tan
    fg07 = "965CA4"; # purple
    bg08 = "3E2D2C"; # dark red
    bg09 = "3E322D"; # dark orange
    bg10 = "3E372D"; # dark yellow
    bg11 = "323226"; # dark green
    bg12 = "323634"; # dark lightblue
    bg13 = "30333D"; # dark darkblue
    bg14 = "443C35"; # dark tan
    bg15 = "2E2530"; # dark purple
  };
}
