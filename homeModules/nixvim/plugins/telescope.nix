{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true; # Improves sorting performance significantly
      };
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fr" = "oldfiles"; # Recent files
      };
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
              preview_width = 0.55;
            };
          };
          sorting_strategy = "ascending";
          file_ignore_patterns = [
            "^.git/"
            "^node_modules/"
            "^target/"
          ];
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];
  };
}
