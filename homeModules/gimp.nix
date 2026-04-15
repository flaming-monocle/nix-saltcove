{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    gimp
  ];
}
