{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    extraPlugins = {
      floaterm = {
        package = pkgs.vimPlugins.vim-floaterm;
      };
    };
  };
}
