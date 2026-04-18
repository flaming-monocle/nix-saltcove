{ pkgs, ... }:
{
  # Unified settings per-user across hosts
  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Kobi";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "9231";
      shell = pkgs.zsh;
    };
  };

  home-manager = {
    users.kobi = {
      imports = [
        ./../home.nix
        ./../homeModules/audacity.nix
        ./../homeModules/font-manager.nix
        ./../homeModules/freecad.nix
        ./../homeModules/libreoffice.nix
        ./../homeModules/obsidian.nix
        ./../homeModules/reaper.nix
        ./../homeModules/shotcut.nix
        ./../homeModules/thunderbird.nix
        ./../homeModules/transmission.nix
        ./../homeModules/gaming.nix
        ./../homeModules/waylandDesktop/hyprland.nix
        ./../homeModules/hyprpaper.nix
        ./../homeModules/hyprpolkit.nix
        ./../homeModules/kitty.nix
        ./../homeModules/math.nix
        #./../homeModules/nixvim
        ./../homeModules/obs.nix
        ./../homeModules/rofi.nix
        ./../homeModules/starship.nix
        ./../homeModules/swaync.nix
        ./../homeModules/thunar.nix
        ./../homeModules/waybar.nix
        ./../homeModules/zsh.nix
        ./../homeModules/gimp.nix
      ];
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = "flaming-monocle";
            email = "kobi.l.oreilly@gmail.com";
          };
          credential.helper = "${
              pkgs.git.override { withLibSecret = true; }
            }/bin/git-credential-libsecret";
        init.defaultBranch = "main";
        };
      };
    };
  };
}
