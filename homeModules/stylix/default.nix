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

  # `external = true;` installs the selected scheme
  # `external = flase;` generates the theme locally
  theme = {
    # mkMerge [
    #   (mkIf (username == "kobi") {
    #     # TODO: https or github: notation
    scheme = ./../../colorschemes/darkmoss.yaml;
    genSource = ./../../wallpapers/mossy.jpg;
    external = true;
    genPolarity = "dark";
    termOpacity = 0.6;
    #   })
    #   (mkIf (username == "carlisle") {
    #     scheme = "github:tinted-theming/schemes/base24/catppuccin-mocha.yaml";
    #     genSource = "west.jpg";
    #     external = true;
    #     genPolarity = "dark";
    #     termOpacity = 0.7;
    #   })
    #   (mkIf (username == "tui") {
    #     scheme = "github:tinted-theming/schemes/base16/charcoal";
    #     genSource = "";
    #     external = false;
    #     genPolarity = "dark";
    #     termOpacity = 1.0;
    #   })
    # ];
  };
in
{
  stylix = mkMerge [
    #-- Unconditional --#
    {
      enable = true;
      image = theme.genSource;
      polarity = theme.genPolarity;
      opacity.terminal = theme.termOpacity;

      # targets = {
      #   starship.enable = false;
      #   neovim.enable = false;
      #   nvf.enable = false;
      #   vim.enable = false;
      #   nvim.enable = false;
      # };

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
    (mkIf theme.external {
      base16Scheme = theme.scheme;
    })
  ];

  # If this isn't set, rebuilding throws a warning about choosing a version
  gtk.gtk4.theme = null;

}
