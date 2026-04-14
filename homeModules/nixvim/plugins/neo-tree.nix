{ ... }:
{
  config.programs.nixvim.plugins.neo-tree = {
    enable = true;
    loseIfLastWindow = true;
    filesystem = {
      follow_current_file.enabled = true;
      filtered_items.hide_dotfiles = false;
    };
  };
}
