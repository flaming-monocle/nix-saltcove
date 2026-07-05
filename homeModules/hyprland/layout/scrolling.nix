{ lib, osConfig, ... }:
let
  inherit (lib) mod mkMerge mkIf;
  inherit (osConfig.networking) hostName;

  mainMonitor = "DP-3";
  portraitMonitor = "DP-1";
  bifrostMonitor = "eDP-1";

  wsRange = builtins.genList (i: i + 1) 10;
  # Maintains hjkl nav on any horizontal-tape monitor in a multi-monitor configuration
  wsSwapVal = if hostName == "snowblack" then "2" else "1";
in
{
  config = mkMerge [
    #-- Unconditional --#
    {
      custom.hyprland = {
        layoutBind = [
          # Scrolling layout vim binds
          "$mod SHIFT, H, layoutmsg, swapcol l"
          "$mod, H, layoutmsg, focus l"
          "$mod SHIFT, L, layoutmsg, swapcol r"
          "$mod, L, layoutmsg, focus r"
          "$mod SHIFT, J, movetoworkspace, +${wsSwapVal}"
          "$mod, J, workspace, +${wsSwapVal}"
          "$mod SHIFT, K, movetoworkspace, -${wsSwapVal}"
          "$mod, K, workspace, -${wsSwapVal}"
          # TODO Make per-monitor
          # TODO column-resize keybinds:
          "$mod, T, layoutmsg, colresize -conf"
          "$mod, Y, layoutmsg, colresize +conf"
        ];
      };
      wayland.windowManager.hyprland = {
        settings = {
          # no focus change on hover, ref general.no_focus_fallback
          input."follow_mouse" = 2;
          general = {
            layout = "scrolling";
          };
        };
      };
    }
    (mkIf (hostName == "snowblack") {
      custom.hyprland = {
        layoutWorkspace = map (
          ws:
          if (mod ws 2 == 0) then
            "${toString ws}, monitor:${portraitMonitor}, layoutopt:direction:down, default:true"
          else
            "${toString ws}, monitor:${mainMonitor}, layoutopt:direction:right, default:true"
        ) wsRange;
        # layoutWindowrule = [
        #   # TODO this is broken
        #   # "match:class kitty, column_width = 0.33"
        # ];
      };
      wayland.windowManager.hyprland = {
        settings = {
          # mouse-over scrolling, but not focusing
          general.no_focus_fallback = true;
          scrolling = {
            column_width = 0.5;
            explicit_column_widths = "0.125, 0.25, 0.33, 0.5, 0.66, 0.75, 0.875, 1";
            fullscreen_on_one_column = false;
            # Focused window stays centered in viewport
            focus_fit_method = 1;
          };
        };
      };
    })
    (mkIf (hostName == "bifrost") {
      # TODO Disable splitting windows
      custom.hyprland = {
        layoutWorkspace = map (
          ws: "${toString ws}, monitor:${bifrostMonitor}, layoutopt:direction:right, default:true"
        ) wsRange;
        # layoutWindowrule = [
        #   # TODO this is broken
        #   # "match:class kitty, column_width = 0.33"
        # ];
      };
      wayland.windowManager.hyprland = {
        settings = {
          # mouse-over scrolling, but not focusing
          general.no_focus_fallback = true;
          scrolling = {
            column_width = 0.5;
            explicit_column_widths = "0.33, 0.5, 0.66, 1";
            fullscreen_on_one_column = true;
            # Newly focused windows move within and push viewport
            focus_fit_method = 1;
          };
          # Laptop gesture controls in scrolling layout
          # TODO up and down both register as up
          gesture = [
            "3, left, layoutmsg, focus l"
            "3, down, workspace, m+1"
            "3, up, workspace, m-1"
            "3, right, layoutmsg, focus r"
            # "3, vertical, workspace"
          ];
          # workspace_swipe_invert = false;
        };
      };
    })
  ];
}
