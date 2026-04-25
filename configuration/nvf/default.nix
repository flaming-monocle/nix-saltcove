{
  pkgs,
  ...
}:
{
  # Sources:
  # gh:jack-thesparrow/schrovimger
  # gh:C4E5G3/nvf

  imports = [
    ./core
    ./plugins
    # ./themes
    # ./ui
    # ./utility
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      lsp = {
        trouble.enable = true;
      };

      diagnostics = {
        enable = true;
        config = {
          virtual_lines = true;
          virtual_text = false;
        };
      };

      extraPlugins = with pkgs.vimPlugins; {
        #neotree.package = neo-tree-nvim;
        #lsp-config.package = nvim-lspconfig;
        #plenary.package = plenary-nvim;
        #telescope-ui.package = telescope-ui-select-nvim;
        #telescope-fzf.package = telescope-fzf-native-nvim;
        #telescope-git.package = telescope-github-nvim;
        #telescope-frecency.package = telescope-frecency-nvim;
        #telescope-undo.package = telescope-undo-nvim;
        #telescope-live-grep.package = telescope-live-grep-args-nvim;
      };
    };
  };
}
