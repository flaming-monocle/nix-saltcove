{ lib, osConfig, ... }:
let
  inherit (lib) mod;

  snowblack = osConfig.networking.hostName == "snowblack";
  # hostBifrost = osConfig.networking.hostName == "bifrost";

  mainMonitor = "DP-3";
  portraitMonitor = "DP-1";
  bifrostMonitor = "eDP-1";

  wsRange = builtins.genList (i: i + 1) 10;
  # Maintains hjkl nav on any horizontal-tape
  # monitor in a multi-monitor configuration
  wsSwapVal = if snowblack then "2" else "1";
in
{
  config = {
    custom.hyprland = {
      layoutBind = [
        # Scrolling layout vim binds
        # TODO Make per-monitor
        # TODO Disable splitting windows vertically
        "$mod SHIFT, H, layoutmsg, swapcol l"
        "$mod, H, layoutmsg, focus l"
        "$mod SHIFT, L, layoutmsg, swapcol r"
        "$mod, L, layoutmsg, focus r"
        "$mod SHIFT, J, movetoworkspace, +${wsSwapVal}"
        "$mod, J, workspace, +${wsSwapVal}"
        "$mod SHIFT, K, movetoworkspace, -${wsSwapVal}"
        "$mod, K, workspace, -${wsSwapVal}"
        # "$mod SHIFT, -, layoutmsg, colresize -0.1"
        # "$mod SHIFT, =, layoutmsg, colresize +0.1"
      ];

      layoutWorkspace =
        if snowblack then
          map (
            ws:
            if (mod ws 2 == 0) then
              "${toString ws}, monitor:${portraitMonitor}, layoutopt:direction:down, default:true"
            else
              "${toString ws}, monitor:${mainMonitor}, layoutopt:direction:right, default:true"
          ) wsRange
        else
          map (
            ws: "${toString ws}, monitor:${bifrostMonitor}, layoutopt:direction:right, default:true"
          ) wsRange;

      layoutWindowrule = [
        # TODO this is broken
        # Be sure to enable
        # "match:class kitty, column_width = 0.22"
      ];
    };

    wayland.windowManager.hyprland = {
      settings = {
        # no focus change on hover, ref general.no_focus_fallback
        input."follow_mouse" = 2;
        general = {
          layout = "scrolling";
          # mouse-over scrolling, but not focusing
          no_focus_fallback = true;
        };
        scrolling = {
          # Centers focused window in scroll
          # focus_fit_method = 0;
          # column_width = 0.5;
          # fullscreen_on_one_column = false;
          # wrap_focus = true;
        };
      };
    };
  };
}
