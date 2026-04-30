{ ... }:
{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      lspSignature.enable = false;
      lspkind.enable = true;
      trouble.enable = true;

      formatOnSave = true;

      lspsaga = {
        enable = true;
        setupOpts = {
          lightbulb = {
            enable = false;
          };
        };
      };

      inlayHints.enable = false;
      lightbulb.enable = false;
      null-ls.enable = true;
    };

    ui.borders.plugins.lspsaga = {
      enable = true;
    };

    diagnostics = {
      enable = true;
      config = {
        virtual_lines = false;
        virtual_text = false;
      };
    };
  };
}
