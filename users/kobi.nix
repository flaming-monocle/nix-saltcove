{
  pkgs,
  ...
}:
{
  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Kobi";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      initialPassword = "1111";
      shell = pkgs.zsh;
    };
  };

  environment.systemPackages = with pkgs; [
    # Deprecated:
    # hyprland
    # hyprpolkitagent
  ];

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };
  services.gvfs.enable = true;

  home-manager = {
    users.kobi =
      { stylix, ... }:
      {
        imports = [
          stylix.homeModules.stylix
          ./../home.nix
          ./../homeModules/audacity.nix
          ./../homeModules/discord.nix
          ./../homeModules/font-manager.nix
          #./../homeModules/freecad.nix
          ./../homeModules/gaming.nix
          ./../homeModules/gimp.nix
          ./../homeModules/git.nix
          ./../homeModules/waylandDesktop/hyprland-unstable.nix
          ./../homeModules/hyprpaper.nix
          ./../homeModules/hyprpolkit.nix
          ./../homeModules/kitty.nix
          ./../homeModules/math.nix
          ./../homeModules/minitube.nix
          # ./../homeModules/libreoffice.nix
          # Deprecated, refer to /configuration/nvf/
          # ./../homeModules/nixvim
          ./../homeModules/obs.nix
          ./../homeModules/obsidian.nix
          # ./../homeModules/reaper.nix
          ./../homeModules/rofi.nix
          # ./../homeModules/shotcut.nix
          # ./../homeModules/spicetify.nix
          ./../homeModules/starship.nix
          ./../homeModules/stylix/default.nix
          ./../homeModules/swaync.nix
          ./../homeModules/thunderbird.nix
          # ./../homeModules/transmission.nix
          ./../homeModules/thunar.nix
          ./../homeModules/waybar.nix
          ./../homeModules/zen-browser.nix
          ./../homeModules/zsh.nix
        ];
      };
  };
}
