{ ... }:
let
  treesitterLanguages = [
    "bash"
    "css"
    # "html"
    #"js"
    #"json"
    # "kotlin"
    # "lua"
    "markdown"
    "nix"
    "python"
    # "rust"
    # "sql"
    #"typescript"
    "yaml"
  ];

  treeSitterEnables = builtins.listToAttrs (
    builtins.map (lang: {
      name = lang;
      value = {
        treesitter.enable = true;
      };
    }) treesitterLanguages
  );
in
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
        enable = true;
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
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    }
    // treeSitterEnables;
  };
}
