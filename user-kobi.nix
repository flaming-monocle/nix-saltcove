{ config, pkgs, lib, ... }:
{
  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Kobi";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "9231";
    };
  };

  home-manager = {
    users.kobi = {
      imports = [
        ./home.nix
      ];
      programs.git = {
        enable = true;
        userName = "flaming-monocle";
        userEmail = "kobi.l.oreilly@gmail.com";
      };
    };
    
    home.stateVersion = "25.11";
  };
}
