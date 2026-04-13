{ config, pkgs, lib, ... }:
{
  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Kobi";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
