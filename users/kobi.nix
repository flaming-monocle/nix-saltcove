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

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };

  services = {
    gvfs.enable = true;
    keyd = {
      enable = true;
      keyboards = {
        # The name is just the name of the configuration file, it does not really matter
        default = {
          ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
          settings = {
            main.capslock = "layer(control)"; # may need quotes if contains non-alphabet symbols
            otherlayer = { };
          };
          extraConfig = ""; # any extra-config, e.g. copy/pasted config, just remove ids part
        };
      };
    };
  };

  home-manager = {
    users.kobi =
      { stylix, ... }:
      {
        imports = [
          ./../home.nix

          ## Function
          #./../homeModules/font-manager.nix
          ./../homeModules/gaming.nix
          ./../homeModules/git.nix
          ./../homeModules/waylandDesktop/hyprland-unstable.nix
          ./../homeModules/hyprpaper.nix
          ./../homeModules/hyprpolkit.nix
          ./../homeModules/kitty.nix
          ./../homeModules/math.nix
          # ./../homeModules/libreoffice.nix
          ./../homeModules/rofi.nix
          ./../homeModules/starship.nix
          stylix.homeModules.stylix
          ./../homeModules/stylix/default.nix
          ./../homeModules/swaync.nix
          ./../homeModules/thunar.nix
          ./../homeModules/waybar.nix
          ./../homeModules/zsh.nix

          ## Creation
          # ./../homeModules/audacity.nix
          ./../homeModules/davinci.nix
          #./../homeModules/freecad.nix
          ./../homeModules/gimp.nix
          ./../homeModules/obs.nix
          ./../homeModules/obsidian.nix

          ## Connection
          # ./../homeModules/vesktop.nix
          ./../homeModules/thunderbird.nix
          # ./../homeModules/transmission.nix

          ## Archived
          # ./../homeModules/minitube.nix
          # ./../homeModules/reaper.nix
          # ./../homeModules/shotcut.nix
          # ./../homeModules/spicetify.nix
          # Needs work!
          # ./../homeModules/zen-browser.nix
        ];
      };
  };
}
