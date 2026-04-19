{ config, pkgs, lib, inputs, ... }:
{
  # Source: github:jack-thesparrow/schrovimger/blob/main/core/autocmp.nix
  imports = [
    ./core
    # ./plugins
    # ./themes
    # ./ui
    # ./utility
  ];
  programs.nvf = {
    enable = true;
  };
}
