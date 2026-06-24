{
  pkgs,
  # osConfig,
  # lib,
  ...
}:
# let
#   inherit (lib) mkOption types;
#   host = osConfig.networking.hostname;
# in
{
  #-- User Settings --#
  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Kobi";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      initialPassword = "9231";
      shell = pkgs.zsh;
    };
  };

  programs.zsh.enable = true;

  #-- Home Manager --#
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
          ./../homeModules/waylandDesktop/hyprland.nix
          ./../homeModules/hyprpaper.nix
          ./../homeModules/hyprpolkit.nix
          ./../homeModules/kitty.nix
          ./../homeModules/math.nix
          # ./../homeModules/libreoffice.nix
          # Current iteration has recursion problems. Prefer nvf via configuration.nix
          # ./../homeModules/nixvim
          # ./../homeModules/obs.nix
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
          ./../homeModules/zsh.nix
        ];
      };
  };
}
