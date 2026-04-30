{ pkgs, ... }:
let
  spicePkgs = spicetify-nix.legacyPackages.${pkgs.stenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
    ];
    enabledCustomApps = with spicePkgs.apps; [
      ncsVisualizer
    ];
  };
}
