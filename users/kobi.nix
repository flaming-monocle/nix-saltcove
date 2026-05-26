{ pkgs, ... }:
{
  # Unified settings per-user across hosts

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
          ./../homeModules/waylandDesktop/hyprland.nix
          ./../homeModules/hyprpaper.nix
          ./../homeModules/hyprpolkit.nix
          ./../homeModules/kitty.nix
          ./../homeModules/math.nix
          # ./../homeModules/libreoffice.nix
          # ./../homeModules/nixvim # Current iteration has recursion problems. Prefer nvf via configuration.nix
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
          # ./../homeModules/thunar.nix
          ./../homeModules/waybar.nix
          ./../homeModules/zsh.nix
        ];
        programs.git = {
          enable = true;
          settings = {
            user = {
              name = "flaming-monocle";
              email = "kobi.l.oreilly@gmail.com";
            };
            credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
            init.defaultBranch = "main";
          };
        };
      };
  };
}
