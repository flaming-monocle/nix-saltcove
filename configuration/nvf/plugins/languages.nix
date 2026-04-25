{ ... }:
{
  programs.nvf.settings.vim = {
    lsp.servers.nixd.enable = true;
    languages = {
      enableFormat = true;
      enableDAP = false; # TODO
      enableExtraDiagnostics = true;
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
            "deadnix"
          ];
        };
      };

      markdown = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        extensions = {
          markview-nvim.enable = true;
          render-markdown-nvim.enable = true;
        };
      };

      python = {
        enable = true;
        lsp.enable = true;
        format.enable = true;
        treesitter.enable = true;
      };

      yaml = {
        enable = true;
        lsp.enable = true;
      };
    };
  };
}
