{ ... }:
{
  programs.nvf.settings.vim = {
    treesitter = {
      enable = true;
      fold = true;
      highlight.enable = true;
      indent.enable = true;
      addDefaultGrammars = true;
      autotagHtml = true;

      context = {
        enable = false;
        setupOpts = {
          line_numbers = true;
          max_lines = 3;
          min_window_height = 0;
          mode = "cursor";
          multiline_threshold = 20;
          separator = "---";
          trim_scope = "outer";
          zindex = 20;
        };
      };
    };
  };
}
