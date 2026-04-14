{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar
  ];
  # Thumbnail support
  services.tumbler.enable = true;
}
