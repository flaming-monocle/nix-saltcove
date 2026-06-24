{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    settings = lib.mkMerge [
      {
        # Font and cursor
        font_size = 15.0;
        adjust_line_height = "100%";
        cursor_shape = "block";
        cursor_blink_interval = 0.5;
        cursor_trail = 1;
        cursor_trail_decay = "0.05 0.20";
        cursor_trail_start_threshold = 1;

        # Technical settings
        scrollback_lines = 10000;
        enable_audio_bell = "no";
        confirm_os_window_close = 0;
        shell_integration = "enabled";
        shell = "zsh";

        # Visuals
        #background_opacity = 0.5;
        inactive_text_alpha = 1;
        url_style = "dotted";
        show_hyperlink_targets = "yes";
        window_padding_width = 0;

        # Binds
        open_url_modifiers = "ctrl";
        kitty_mod = "alt";
        "map ctrl+equal" = "change_font_size all +0.5";
        "map ctrl+minus" = "change_font_size all -0.5";
      }

      # Kobi-specific binds
      (lib.mkIf (config.home.username == "kobi") {
        "map ctrl+y" = "copy_to_clipboard";
        "map ctrl+p" = "paste_from_clipboard";
        "map alt+h" = "neighboring_window left";
        "map alt+j" = "neighboring_window down";
        "map alt+k" = "neighboring_window up";
        "map alt+l" = "neighboring_window right";
        "map shift+alt+l" = "next_layout";
      })

      # Carlisle-specific settings
      (lib.mkIf (config.home.username == "carlisle") {
      })
    ];
  };
}
