{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kalker
    qalculate-gtk
    gnuplot # qualculate graphing depencency
  ];
}
