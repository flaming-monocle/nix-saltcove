{ pkgs, ... }:
{
  home.packages = with pkgs; [
    steam
    protonup-ng
    protontricks
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    protontricks.enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        libxcursor
        libxi
				libxinerama
        libxscrnsaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };

  programs.gamemode.enable = true; 

  # Proton GE
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
