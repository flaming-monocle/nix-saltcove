{
  lib,
  ...
}:
{
  programs.neovim = {
    enable = true;
    extraConfig = lib.fileContents ./init.lua;
    viAlias = true;
    vimalias = true;
  };
}
