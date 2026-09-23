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
          stylix.homeModules.stylix
          # ./../homeModules/audacity.nix
          # ./../homeModules/vesktop.nix
          #./../homeModules/font-manager.nix
          #./../homeModules/freecad.nix
          ./../homeModules/gaming.nix
          ./../homeModules/gimp.nix
          ./../homeModules/git.nix
          ./../homeModules/waylandDesktop/hyprland-unstable.nix
          ./../homeModules/hyprpaper.nix
          ./../homeModules/hyprpolkit.nix
          ./../homeModules/kitty.nix
          ./../homeModules/math.nix
          # ./../homeModules/minitube.nix
          # ./../homeModules/libreoffice.nix
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
