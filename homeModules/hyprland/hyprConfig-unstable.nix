{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
# Overview: Why is it unstable?
# Configuration language switched from Hyprlang to lua in 0.55
#   Eval warning:
#     wayland.windowManager.hyprland.configType default changed
#     Current: `"hyprlang"` New: `"Lua"`
#     Reason for difference: home.stateVersion < 26.05
# As of 260628, she builds with no errors

let
  inherit (lib)
    mkIf
    mkMerge
    mod
    mkForce
    ;
  inherit (osConfig.networking) hostName;
  inherit (config.lib.stylix) colors;

  mainMonitor = "DP-3";
  portraitMonitor = "DP-1";
  bifrostMonitor = "eDP-1";

  wsRange = builtins.genList (i: i + 1) 9;
  # Maintains hjkl nav in multi-monitor config
  wsSwapVal = if hostName == "snowblack" then "2" else "1";

  layoutType = "scrolling";
in
{
  home.packages = with pkgs; [
    hyprcursor
    rose-pine-hyprcursor
    hyprshot
  ];
  wayland.windowManager.hyprland = mkMerge [
    {
      #-- Unconditional Hyprland configs --#
      enable = true;
      configType = "hyprlang";
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
          # TODO define scrolling-layout specific binds that
          # open and immediately resize a given window
          # Probably best handled by a bind that calls a script

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
        ]
        ++ [
          # System Controls
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 2%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 2%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
          #", XF86AudioPlay, exec, playerctl play-pause"
          #", XF86AudioPause, exec, playerctl play-pause"
          #", XF86AudioPrev, exec, playerctl previous"
          #", XF86AudioNext, exec, playerctl next"
          "SHIFT, PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m output"
          "SHIFT CONTROL, PRINT, exec, hyprshot -o ~/Pictures/Screenshots -m region"
        ]
        ++ [
          # Windows
          "$mod, Space, togglefloating"
        ]
        ++ [
          #  # Workspaces
          #  builtins.genList
          #  (
          #    i:
          #    let
          #      ws = i + 1;
          #    in
          #    [
          #      "$mod, ${toString ws}, workspace, ${toString ws}"
          #      "$mod SHIFT, ${toString ws}, movetoworkspace ${toString ws}"
          #    ]
          #  )
          #  9
          #  "$mod SHIFT, 0, movetoworkspace, 10"
          #];

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
        ];

        bindm = [
          "$mod, mouse:273, resizewindow"
          "$mod, mouse:272, movewindow"
        ];

        workspace = [ ];

        windowrule = [ ];

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
          layout = layoutType;
          gaps_in = "4";
          gaps_out = "8,8,0,8";
          border_size = "2";
          resize_on_border = false;
          allow_tearing = false;
          "col.active_border" = mkForce "rgb(${colors.base0C}) rgb(${colors.base0E}) 30deg";
          "col.inactive_border" = mkForce "rgb(${colors.base04}) rgb(${colors.base01}) 30deg";
        };

        input = {
          "accel_profile" = "flat";
          "numlock_by_default" = "true";
        };

        misc = {
          # "vfr" = "true";
          "disable_splash_rendering" = "true";
          # "disable_hyprland_logo" = "true";
        };
      };
    }
    (mkIf (hostName == "snowblack") {
      settings = {
        # no focus change on hover, ref general.no_focus_fallback
        input."follow_mouse" = 2;
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
        workspace = map (
          ws:
          if (mod ws 2 == 0) then
            "${toString ws}, monitor:${portraitMonitor}, layoutopt:direction:down, default:true"
          else
            "${toString ws}, monitor:${mainMonitor}, layoutopt:direction:right, default:true"
        ) wsRange;
      };
    })
    (mkIf (hostName == "bifrost") {
      settings = {
        # focus change on hover enabled
        input."follow_mouse" = 1;
        env = [
          "HYPRCURSOR_THEME,rose-pine-hyprcursor"
          "HYPRCURSOR_SIZE,32"
        ];
        monitor = [ "${bifrostMonitor}, 1920x1080@60, 0x0, 1" ];
        workspace = map (
          ws: "${toString ws}, monitor:${bifrostMonitor}, layoutopt:direction:right, default:true"
        ) wsRange;
      };
    })
    (mkIf (layoutType == "scrolling") {
      settings = mkMerge [
        {
          scrolling = {
            # Focused window stays centered in viewport
            focus_fit_method = 1;
          };
          bind = [
            # Vim binds
            # TODO Make per-monitor
            "$mod SHIFT, H, layoutmsg, swapcol l"
            "$mod, H, layoutmsg, focus l"
            "$mod SHIFT, L, layoutmsg, swapcol r"
            "$mod, L, layoutmsg, focus r"
            "$mod SHIFT, J, movetoworkspace, +${wsSwapVal}"
            "$mod, J, workspace, +${wsSwapVal}"
            "$mod SHIFT, K, movetoworkspace, -${wsSwapVal}"
            "$mod, K, workspace, -${wsSwapVal}"
            "$mod, T, layoutmsg, colresize -conf"
            "$mod, Y, layoutmsg, colresize +conf"
          ];
        }
        (mkIf (hostName == "snowblack") {
          scrolling = {
            column_width = 0.4;
            explicit_column_widths = "0.25, 0.33, 0.4, 0.5, 0.6, 0.66, 0.75, 1";
            fullscreen_on_one_column = false;
          };
        })
        (mkIf (hostName == "bifrost") {
          scrolling = {
            column_width = 0.5;
            explicit_column_widths = "0.33, 0.5, 0.66, 1";
            fullscreen_on_one_column = true;
          };
          # TODO up and down both register as up
          gesture = [
            "3, left, layoutmsg, focus l"
            "3, down, workspace, m+1"
            "3, up, workspace, m-1"
            "3, right, layoutmsg, focus r"
            # "3, vertical, workspace"
          ];
          # workspace_swipe_invert = false;
        })
      ];
    })
    (mkIf (layoutType == "dwindle") {
      settings = mkMerge [
        { }
        (mkIf (hostName == "snowblack") { })
        (mkIf (hostName == "bifrost") { })
      ];
    })
  ];
}
