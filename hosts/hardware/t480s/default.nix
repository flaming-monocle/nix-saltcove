{ lib, ... }:

{
  services.throttled.enable = lib.mkDefault true;
}
