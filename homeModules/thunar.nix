{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar
  ];
  # Thumbnail support
  # Nix throws error: does not exist
  # services.tumbler.enable = true;
}
