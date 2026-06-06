{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib)
    mkOption
    types
    # mkForce
    mkIf
    mkMerge
    ;
  # inherit (config.custom.stylix)
  #   colors
  #   ;
  inherit (osConfig.networking) hostName;

  mainMonitor = "DP-3";
  portraitMonitor = "DP-1";
  bifrostMonitor = "eDP-1";
in
{
  options.custom.hyprland = {
    layoutBind = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
    layoutBindm = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
    layoutWorkspace = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
    layoutWindowrule = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
  };

  imports = [
    ./hyprland-layout/scrolling.nix
    # ./hyprland-layout/dwindle.nix
  ];

  config = {
    home.packages = with pkgs; [
      hyprcursor
      rose-pine-hyprcursor # sourced through /flake-desktop/flake.nix
      hyprshot
    ];

    wayland.windowManager.hyprland = mkMerge [
      #-- Unconditional --#
      {
        enable = true;
        settings = {
          "$mod" = "SUPER";
          "$terminal" = "kitty";
          "$fileManager" = "thunar";
          "$menu" = "rofi";

          "ecosystem:no_update_news" = true;

          animations = {
            enabled = true;
            animation = [
              "workspaces, 1, 3, easeOutBack, slidevert"
              "windowsIn, 1, 3, easeInOut, popin 80%"
              "windowsOut, 1, 3, easeInOut, popin 80%"
              "windowsMove, 1, 1, easeInOut, popin 40%"
              "border, 1, 3, easeInOut"
              "borderangle, 1, 4, easeOutBack"
              "fade, 1, 5, default"
            ];
            bezier = [
              "easeInOut, 0.5, 0, 0.5, 1"
              "easeOutBack, 0.5, 1.2, 0.5, 1"
            ];
          };

          bind = [
            # Applications
            "$mod, Return, exec, $terminal"
            #"$mod, CAPS, exec, $terminal" # TODO work on this
            "$mod, Q, killactive"
            "$mod, R, exec, $fileManager"
            ''$mod, V, exec, $terminal -e "vim"''
            "$mod, F, exec, firefox"
            "$mod, D, exec, $menu -show drun"
            "$mod, O, exec, obsidian"
            "$mod, S, exec, spotify"
            "$mod, G, exec, gimp"
            ''$mod, C, exec, [float; size 400 400] $terminal -e "kalker"''
            "$mod SHIFT, C, exec, [float;size 800 400] qalculate-gtk"

            # System Controls
            ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
            #", XF86AudioPlay, exec, playerctl play-pause"
            #", XF86AudioPause, exec, playerctl play-pause"
            #", XF86AudioPrev, exec, playerctl previous"
            #", XF86AudioNext, exec, playerctl next"
            "SHIFT, PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m output"
            "SHIFT CONTROL, PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m region"

            # Workspaces
            "$mod, Space, togglefloating"
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"
            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"
          ]
          ++ config.custom.hyprland.layoutBind;

          bindm = [
            "$mod, mouse:273, resizewindow"
            "$mod, mouse:272, movewindow"
          ]
          ++ config.custom.hyprland.layoutBindm;

          decoration = {
            rounding = 5;
            active_opacity = 1.0;
            inactive_opacity = 0.9;
            blur = {
              enabled = true;
              size = 4;
              passes = 3;
              new_optimizations = true;
              ignore_opacity = true;
              xray = false;
            };
          };

          exec-once = [
            "systemctl --user import-environment WAYLAND_DISPLAY XDG_RUNTIME_DIR HYPRLAND_INSTANCE_SIGNATURE"
            "systemctl --user start hyprpolkitagent"
            "waybar"
            "hyprpaper"
          ];

          general = {
            gaps_in = "4";
            gaps_out = "8,8,0,8";
            border_size = "2";
            resize_on_border = false;
            allow_tearing = false;
            # "col.active_border" = mkForce "rgb(${colors.base0C}) rgb(${colors.base0E}) 30deg";
            # "col.inactive_border" = mkForce "rgb(${colors.base04}) rgb(${colors.base01}) 30deg";
          };

          input = {
            "accel_profile" = "flat";
            "numlock_by_default" = "true";
          };

          misc = {
            "vfr" = "true";
            # "disable_hyprland_logo" = "true";
            "disable_splash_rendering" = "true";
          };

          # windowrule = [
          #   # TODO this is broken
          #   # "match:class obsidian, opacity 0.95 override 0.95 override"
          #   "match:class kitty, column_width = 0.33"
          # ]
          # ++ config.custom.hyprland.layoutWindowrule;

          workspace = config.custom.hyprland.layoutWorkspace;
        };
      }
      #-- Conditional --#
      (mkIf (hostName == "snowblack") {
        settings = {
          env = [
            #"LIBVA_DRIVER_NAME,nvidia"
            #"__GLX_VENDOR_LIBRARY_NAME,nvidia"
            "HYPRCURSOR_THEME,rose-pine-hyprcursor"
            "HYPRCURSOR_SIZE,25"
          ];
          monitor = [
            "${portraitMonitor}, 2560x1080@60, 3440x-660, 1, transform, 3"
            "${mainMonitor}, 3440x1440@143.92, 0x0, 1"
          ];
        };
      })
      (mkIf (hostName == "bifrost") {
        settings = {
          env = [
            "HYPRCURSOR_THEME,rose-pine-hyprcursor"
            "HYPRCURSOR_SIZE,35"
          ];
          monitor = [ "${bifrostMonitor}, 1920x1080@60, 0x0, 1" ];
        };
      })
    ];
  };
}
