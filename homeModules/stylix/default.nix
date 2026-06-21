{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    ;
  inherit (config.home) username;

  #-- Theme Archive --#
  # Catppuccin Mocha - github:tinted-theming/schemes/base24/catppuccin-mocha.yaml
  # Darkmoss - github:tinted-theming/schemes/base16/darkmoss.yaml
  # Sea Shells - github:tinted-theming/schemes/sea-shells.yaml
  # Charcoal - github:tinted-theming/schemes/base16/charcoal

in
{
  stylix = mkMerge [
    #-- Unconditional --#
    {
      enable = true;
      targets = {
        #   starship.enable = false;
        neovim.enable = true;
        nvf.enable = true;
        vim.enable = true;
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
    }
    #-- Conditional --#
    (mkIf (username == "kobi") {
      # tinted-theming .yaml file (comment to generate locally)
      base16Scheme = ./../../colorschemes/darkmoss.yaml;
      # Local generation
      image = ./../../wallpapers/mossy.jpg;
      polarity = "dark";
      # Other
      opacity.terminal = 0.6;
    })
    (mkIf (username == "carlisle") {
      # tinted-theming .yaml file (comment to generate locally)
      base16Scheme = ./../../colorschemes/catppuccin-mocha.yaml;
      # Local generation
      image = ./../../wallpapers/west.jpg;
      polarity = "dark";
      # Other
      opacity.terminal = 0.7;
    })
    (mkIf (username == "tui") {
      # tinted-theming .yaml file (comment to generate locally)
      base16Scheme = ./../../colorschemes/charcoal-dark;
      # Local generation
      image = ./../../wallpapers/mossy.jpg;
      polarity = "dark";
      # Other
      opacity.terminal = 0.6;
    })
  ];
  # If this isn't set, rebuilding throws a warning about choosing a version
  gtk.gtk4.theme = null;
}
