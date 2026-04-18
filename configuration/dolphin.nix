{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.qtsvg # svc icons support
  ];
}
