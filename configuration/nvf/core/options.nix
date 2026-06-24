{ lib, osConfig, ... }:
let
  # inherit (osConfig.networking) hostName;
  inherit (lib) mkMerge mkIf concatStrings;
in
{
  programs.nvf.settings.vim = {
    options = mkMerge [
      {
        # Numbering
        number = true;
        relativenumber = true;

        # Tab Settings
        tabstop = 2;
        softtabstop = 2;
        showtabline = 2;
        expandtab = true;

        # Indentation
        smartindent = true;
        shiftwidth = 2;
        breakindent = true;

        # Fold Settings
        foldenable = false;
        foldcolumn = "1";
        foldlevel = 99;
        foldlevelstart = 99;

        shada = "!,'100,<50,s10,h";
        #shadafile = "NONE";

        # Disable text wrapping by default
        # - in favor of smartcolumn with p.n.s.v.ui.smartcolumn
        # - with wrap-enable by filetype with p.n.s.v.autocmds
        wrap = false;

        # Cursor line highlighting
        # Type: one of "line", "screenline", "number", "both"
        cursorlineopt = "line";

        # Offset between cursor and viewport edge
        scrolloff = 8;
      }

      # TODO
      # Pretty sure this is failing because nvf is
      # not installed as a home-manager module:

      # (mkIf (hostName == "snowblack") {
      #   # Offset between cursor and viewport edge
      #   scrolloff = 10;
      # })
      # (mkIf (hostName == "bifrost") {
      #   # Offset between cursor and viewport edge
      #   scrolloff = 8;
      # })
    ];

    autocmds = [
      {
        # Gives text-based files a soft paragraph wrap
        enable = true;
        event = [ "FileType" ];
        pattern = [
          "markdown"
          "text"
          "gitcommit"
        ];
        command = concatStrings [
          "setlocal wrap"
          " "
          "textwidth=72"
          " "
          "formatoptions+=t"
          " "
          "spell spelllang=en_us"
        ];
      }
    ];

    ui = {
      illuminate.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts = {
          # Hides column line for auto-wrapped filetypes
          disabled_filetypes = [
            "help"
            "text"
            "markdown"
            "terminal"
            "gitcommit"
          ];
          scope = "file";

          custom.colorcolumn = {
            nix = [
              "72"
              "80"
            ]; # Matches 33% terminal width with 16 & 15 pt. text
            python = "88"; # Matches Black formatter
          };
        };
      };
    };
  };
}
