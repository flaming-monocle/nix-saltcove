{ config, lib, ... }:
{
  services.tlp.enable = lib.mkDefault (!config.services.power-profiles-daemon.enable);
}
