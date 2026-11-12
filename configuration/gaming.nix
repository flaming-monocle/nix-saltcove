{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam
    protonup-ng
    protontricks
    steamtinkerlaunch
    # proton-ge-bin
    # nexusmods-app-unfree
  ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraPackages = with pkgs; [
      #   # proton-ge-bin
      steamtinkerlaunch
    ];
    # extraCompatPackages = with pkgs; [
    #   # proton-ge-bin
    #   steamtinkerlaunch
    # ];
    # protontricks.enable = true;
    # package = pkgs.steam.override {
    #   extraPkgs =
    #     pkgs: with pkgs; [
    #       libxcursor
    #       libxi
    #       libxinerama
    #       libxscrnsaver
    #       libpng
    #       libpulseaudio
    #       libvorbis
    #       stdenv.cc.cc.lib
    #       libkrb5
    #       keyutils
    #     ];
    # };
  };
}
