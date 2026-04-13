{ config, pkgs, lib, ... }:
{
  users.users = {
    carlisle = {
      isNormalUser = true;
      description = "Carlisle";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
