{ ... }:
{
  programs.nixvim.plugins = {
    highlight-colors = {
      enable = true;
      render = "virtual";
      virtual_symbol = "󰝤";
      enable_named_colors = true;
    };
  };
}
