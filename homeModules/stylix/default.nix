{
  config,
  pkgs,
  ...
}:
let
  colors = config.custom.colorscheme.apollo;
  user = config.home.username;
  userTheme =
    if user == "kobi" then
      [
        ./everforest.nix
      ]
    else
      [
        ./everforest.nix
      ];
in
{
  #imports = [
  #  userTheme
  #];

  stylix = {
    enable = true;
    targets = {
      starship.enable = false;
      neovim.enable = false;
      nvf.enable = false;
      vim.enable = false;
    };

    opacity = {
      terminal = 0.5;
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

    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";

    #base16Scheme = {
    #  system = "base16";
    #  name = "Apollo16";
    #  author = "Kobi O'Reilly (https://github.com/flaming-monocle)";
    #  palette = {
    #    base00 = "#${colors.bg00}"; # Background
    #    base01 = "#${colors.bg01}"; # Bar background
    #    base02 = "#${colors.bg02}"; # Selection background
    #    base03 = "#${colors.bg04}"; # Comments
    #    base04 = "#${colors.bg05}"; # Dark foreground - status bars, mostly
    #    base05 = "#${colors.bg06}"; # Claret, deliminators, operators
    #    base06 = "#${colors.bg06}"; # not often used
    #    base07 = "#${colors.bg07}"; # not often used
    #    base08 = "#${colors.fg00}"; # Errors, variables, markup links, diff deleted
    #    base09 = "#${colors.fg06}"; # ints, bools, consts, URLs
    #    base0A = "#${colors.fg02}"; # classes, markup bold, search background
    #    base0B = "#${colors.fg03}"; # Verified Bash commands, strings, markup code, diff inserted
    #    base0C = "#${colors.fg04}"; # support, regex, esc, markup quotes
    #    base0D = "#${colors.fg05}"; # functions, methods, headings
    #    base0E = "#${colors.fg01}"; # Warnings, keywords, storage, markup italic, diff changed
    #    base0F = "#${colors.fg07}"; # depreciated, some embedded tags
    #  };
    #};
  };

  gtk.gtk4.theme = null;
}
