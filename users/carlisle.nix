{ pkgs, ... }:
{
  # Unified settings per-user across hosts
  users.users = {
    saltServer = {
      isNormalUser = true;
      description = "carlisle";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "firewillow";
      shell = pkgs.zsh;
    };
  };

  home-manager = {
    users.carlisle = {
      imports = [
        ./../home.nix
        ./../homeModules/waylandDesktop/kde-plasma.nix
        ./../homeModules/gaming.nix
        ./../homeModules/kitty.nix
        ./../homeModules/nixvim
        ./../homeModules/starship.nix
        ./../homeModules/zsh.nix
      ];
    };

    home.stateVersion = "25.11";
  };

  home = {
    username = "carlisle";
    homedirectory = "/home/carlisle";
    packages = with pkgs; [
      # Packages for Carlisle across all hosts:
      gimp
    ];
  };
}
