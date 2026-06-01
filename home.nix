{ pkgs, ... }:
{
  # -- Unified settings for all users across all hosts --

  # Potentially unnecessary for use in Wayland
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    # Archives and Formats
    zip
    unzip
    # rar
    p7zip
    gnutar
    ffmpeg

    # CLI utils
    gnugrep
    ripgrep
    fzf
    wget
    ranger
    killall
    file
    which
    tree

    # Monitoring
    btop
    iotop
    iftop
    lsof
    pciutils
    usbutils
  ];

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.11";
}
