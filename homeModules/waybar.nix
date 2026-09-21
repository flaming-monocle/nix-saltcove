{
  osConfig,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkMerge mkIf;
  inherit (osConfig.networking) hostName;
  inherit (config.lib.stylix) colors;

  mainMonitor = mkMerge [
    (mkIf (hostName == "snowblack") "DP-3")
    (mkIf (hostName == "bifrost") "eDP-1")
  ];
  secondMonitor = mkMerge [
    (mkIf (hostName == "snowblack") "DP-1")
  ];
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        output = mainMonitor;

        modules-left = mkMerge [
          [
            "custom/nixos"
            "clock"
            "hyprland/workspaces"
          ]
          (mkIf (hostName == "snowblack") [ ])
          (mkIf (hostName == "bifrost") [ ])
        ];

        modules-right = mkMerge [
          (mkIf (hostName == "bifrost") [
            "backlight"
            "battery"
          ])
          [
            "pulseaudio"
            "custom/notification"
          ]
          (mkIf (hostName == "snowblack") [ ])
        ];

        "custom/nixos" = {
          format = " ";
          tooltip = false;
          on-click = "rofi"; # Or your preferred launcher
        };

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          all-outputs = false;
          wrap-on-scroll = false;
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };

        battery = {
          states = {
            "good" = 90;
            "warning" = 40;
            "critical" = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          # format-good = "";
          # format-full = "";
          # An empty format will hide the module
          format-icons = [
            "󰂎"
            "󰁻"
            "󰁾"
            "󰂁"
            "󰁹"
          ];
        };

        "cpu" = {
          format = "  {usage}%";
          interval = 10;
        };

        "memory" = {
          format = "  {}%";
          interval = 10;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "  Muted";
          format-icons = " ";
          on-click = "pavucontrol";
        };

        "custom/notification" = {
          tooltip = false;
          format = "󰂚 ";
          on-click = "swaync-client -t -sw";
          escape = true;
        };

        "clock" = {
          # Pretty sure this is right, but TODO doublecheck
          format = "󰃭 {%a. %y %m %d %R}";
          # eg, Sat. 24-04-18 13:44
          tooltip-format = "<tt>{calendar}</tt>";
        };
      };
    };
    # TODO get this integrated with Stylix
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(26, 27, 38, 0.85);
        color: #c0caf5;
        border-bottom: 2px solid rgba(122, 162, 247, 0.5);
      }

      #workspaces button {
        padding: 0 8px;
        color: #565f89;
      }

      #workspaces button.focused {
        color: #7aa2f7;
        background: rgba(122, 162, 247, 0.1);
      }

      #custom-nixos {
        color: #7ebae4;
        padding: 0 15px;
        font-size: 18px;
      }

      #cpu, #memory, #pulseaudio, #clock, #custom-notification {
        padding: 0 10px;
      }

      #cpu { color: #f7768e; }
      #memory { color: #9ece6a; }
      #pulseaudio { color: #e0af68; }
      #clock { color: #bb9af7; }
    '';
  };
}
