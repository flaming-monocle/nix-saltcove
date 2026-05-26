{ pkgs, ... }:
{
  programs.nvf.settings.vim = {
    pluginOverrides = {
      zen-mode = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = "zen-mode.nvim";
        rev = "";
        hash = "";
      };
    };
  };
}
