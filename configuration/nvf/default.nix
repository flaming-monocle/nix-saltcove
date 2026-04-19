{ config, pkgs, lib, inputs, ... }:
{
  # Source: github:jack-thesparrow/schrovimger/blob/main/core/autocmp.nix
  imports = [
    # ./core
    # ./plugins
    # ./themes
    # ./ui
    # ./utility
  ];
  programs.nvf = {
    enable = true;
  };
  
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      name = "everforest";
      style = "hard";
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      python.enable = true;
    };
  };
}
