{ ... }:
{
  programs.nvf.settings.vim = {
    languages = {
      enableFormat = true;
      enableDAP = false; # TODO
      enableExtraDiagnostics = false;
      enableTreesitter = true;

      bash = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
      };

      nix = {
        enable = true;
        format.enable = true;
        format.type = [ "nixfmt" ];
        lsp = {
          enable = true;
          servers = [ "nixd" ];
        };
        extraDiagnostics = {
          enable = true;
          types = [
            "statix"
            # "deadnix"
          ];
        };
      };

      markdown = {
        enable = true;
        lsp.enable = false;
        format = {
          enable = false;
          type = "prettier";
        };
        extensions = {
          markview-nvim.enable = true;
          # render-markdown-nvim.enable = true;
        };
      };

      lua = {
        enable = true;
        lsp = {
          enable = true;
          servers = [ "lua-language-server" ];
        };
        format.enable = true;
      };

      python = {
        enable = true;
        format.enable = true;
        lsp = {
          enable = true;
          servers = [ "pyright" ];
        };
      };

      yaml = {
        enable = true;
        lsp.enable = true;
      };
    };
  };
}
