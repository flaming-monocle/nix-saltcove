{ ... }:
{
  programs.nixvim.plugins.grug-far = {
    enable = true;
    lazyload.settings.cmd = "GrugFar";
  };
}
