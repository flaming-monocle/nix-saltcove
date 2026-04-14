{ pkgs, ... }:
{
  # Unified settings per-user across hosts
  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Kobi";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "9231";
      shell = pkgs.zsh; # TODO declare zsh config
    };
  };

  home-manager = {
    users.kobi = {
      imports = [
        ./../home.nix
        ./../homeModules/gaming.nix
        ./../homeModules/waylandDesktop/hyprland.nix
        ./../homeModules/hyprpaper.nix
        ./../homeModules/hyprpolkit.nix
        ./../homeModules/kitty.nix
        ./../homeModules/math.nix
        ./../homeModules/nixvim
        ./../homeModules/obs.nix
        ./../homeModules/rofi.nix
        ./../homeModules/starship.nix
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
          credential.helper = "${
              pkgs.git.override { withLibSecret = true; }
            }/bin/git-credential-libsecret";
        init.defaultBranch = "main";
        };
      };
    };
    home.stateVersion = "25.11";
  };

  home = {
    username = "kobi";
    homeDirectory = "/home/kobi";
    packages = with pkgs; [
      freecad
      thunderbird
      obsidian
      shotcut
      audacity
      reaper
      transmission_4
      gimp
      libreoffice-qt
    ];
  };
}
