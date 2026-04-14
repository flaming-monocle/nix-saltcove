{ ... }:
{
  config.programs.nixvim.plugins.bufferline = {
    enable = true;
    settings.options = {
      # Keeps the tabs from shifting when Neo-tree opens
      offsets = [{
        filetype = "neo-tree";
        text = "Explorer";
        text_align = "left";
        separator = true;
      }];
    };
  };
}
