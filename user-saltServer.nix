{ config, pkgs, lib, ... }:
{
  users.users = {
    saltServer = {
      isNormalUser = true;
      description = "saltServer";
      extraGroups = [ "networkmanager" "wheel" ];
      initialPassword = "9231";
    };
  };
}
