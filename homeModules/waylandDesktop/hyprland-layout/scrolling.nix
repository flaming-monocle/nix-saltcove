{ lib, osConfig, ... }:
let
  inherit (lib) mod mkIf;
  mainMonitor = "DP-3";
  portraitMonitor = "DP-1";
  bifrostMonitor = "eDP-1";
  wsRange = builtins.genList (i: i + 1) 10;
  host = osConfig.networking.hostName;
  wsSwapVal = 
    if host == "snowblack" then "2"
    else if host == "bifrost" then "1"
    else "1";
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
        "$mod SHIFT, J, movetoworkspace, +${wsSwapVal}"
        "$mod, J, workspace, +${wsSwapVal}"
        "$mod SHIFT, K, movetoworkspace, -${wsSwapVal}"
        "$mod, K, workspace, -${wsSwapVal}"
        "$mod SHIFT, L, layoutmsg, swapcol r"
        "$mod, L, layoutmsg, focus r"
      ];
      layoutWorkspace = if host == "snowblack" then
        builtins.map (ws:
          if (mod ws 2 == 0)
            then "${toString ws}, monitor:${portraitMonitor}, layoutopt:direction:down, default:true"
          else "${toString ws}, monitor:${mainMonitor}, layoutopt:direction:right, default:true"
        ) wsRange
        else builtins.map (ws: 
          "${toString ws}, monitor:${bifrostMonitor}, layoutopt:direction:right, default:true"
        ) wsRange;
      layoutWindowrule = [
        #"match:class gimp, scrolling_width 0.6"
      ];
    };
  
    wayland.windowManager.hyprland = {
      settings = {
        input."follow_mouse" = 2; # no focus change on hover, ref general.no_focus_fallback
        general = {
          layout = "scrolling";
          no_focus_fallback = true; # mouse-over scrolling, but not focusing
        };
        scrolling = {
          focus_fit_method = 0; # Centers focused window in scroll
          column_width = 0.4;
          fullscreen_on_one_column = false;
          #wrap_focus = true;
        };
      };
    };
  };
}
