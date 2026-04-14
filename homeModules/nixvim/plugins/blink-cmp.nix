{ ... }:
{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      #appearance.nerd_font_variant = "mono";
      keymap.preset = "super-tab"; # Everything through tab, baby
      sources.default = [ "lsp" "path" "snippets" "buffer" ];
      fuzzy = {
        implementation = "lua";
      };
      cmdline = {
        completion = {
          list.selection.preselect = false;
          menu.auto_show = true;
        };
        keymap.preset = "super-tab";
      };
      completion = {
        list.selection.preselect = false;
        accept.auto_brackets.enabled = true;
        ghost_text.enabled = true;
        trigger = {
          prefetch_on_insert = true;
          show_on_backspace = false;
        };
      };
    };
  };
}
