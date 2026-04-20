{ config, pkgs, lib, inputs, ... }:
{
  # Sources: 
        # gh:jack-thesparrow/schrovimger
        # gh:C4E5G3/nvf

  imports = [
    # ./core
    # ./plugins
    # ./themes
    # ./ui
    # ./utility
  ];
  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "everforest";
        style = "hard";
      };

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      lsp = {
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
        lspsaga.enable = true;
        trouble.enable = true;
        lspSignature.enable = true;
        lspconfig.enable = true;
        nvim-docs-view.enable = true;
      };
      #   enable = true;
      #   # enableTreesitter = true;

      #   nix.enable = true;
      #   rust.enable = true;
      #   python.enable = true;
      # };

      maps = {
        normal = {
          # Goto - Definition/References/Hover/Formatting
          "<leader>gd".action = "<cmd>lua vim.lsp.buf.definition()<CR>";
          "<leader>gr".action = "<cmd>lua vim.lsp.buf.references()<CR>";
          "<leader>gh".action = "<cmd>lua vim.lsp.buf.hover()<CR>";
          "<leader>gf".action = "<cmd>lua vim.lsp.buf.formatting()<CR>";
        };
      };

      options = {
        # Numbering
        number = true;
        relativenumber = true;
    
        # Tab Settings
        tabstop = 2;
        softtabstop = 2;
        showtabline = 1;
        expandtab = true;
    
        # Indentation
        smartindent = true;
        shiftwidth = 2;
        breakindent = false;
    
        # Fold Settings
        foldenable = false;
        foldcolumn = "1";
        foldlevel = 99;
        foldlevelstart = 99;
    
        # shada = "!,'100,<50,s10,h";
        # shadafile = "NONE";
    
        wrap = true;
      };
    };
  };
}
