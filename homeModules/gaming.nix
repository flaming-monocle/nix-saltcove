{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    protonup-ng
    protontricks
  ];

  # Proton GE
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
