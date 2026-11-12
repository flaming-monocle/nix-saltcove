{
  osConfig,
  lib,
  config,
  builtins,
  ...
}:
let
  inherit (lib) mkMerge mkIf toString;
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
        height = 20;
        spacing = 4;
        output = mainMonitor;

        modules-left = [
          "custom/nixos"
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
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
        ];

        "custom/nixos" = {
          format = " ";
          tooltip = false;
          on-click = "rofi";
        };

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          all-outputs = true;
          wrap-on-scroll = false;
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
            " "
            " "
            " "
            " "
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
          format = " {icon} {volume}%";
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
          # format = "󰃭 {:%a-%y-%m %d %R}";
          format = " {:%a. %y-%m-%d %R} ";
          # eg, Sat. 24-04-18 13:44
          tooltip-format = "<tt>{calendar}</tt>";
        };
      };
    };
    # TODO get this integrated with Stylix
    # CSS:
    # Elements height:
    # Margin - 5;
    # Border - builtin
    # Padding -
    style = ''
      * {
        font-family: "TeX Gyre Bonum";
        font-weight: bold;
        font-size: 10px;
        min-width: 30px;
        min-height: 30px;
      }

      #workspaces buttom, #workspaces button.active, #custom-nixos, #backlight, #battery, #cpu, #memory, #pulseaudio, #clock, #custom-notification {
        margin: 3px 3px 2px 3px;
        padding: 0px;
        border: solid 2px #${toString colors.base06};
        border-radius: 15px;
        color: #${toString colors.base00};
        background: #${toString colors.base04};
      }

      window#waybar {
        background: transparent;
      }

      #workspaces button {
        padding: 0px 1px 0px 1px;
      }

      #workspaces button.active {
        padding: 0px 1px 0px 1px;
      }

      #custom-nixos {
        margin-right: 15px;
        margin-left: 10px;
        padding: 0px 0px 0px 2px;
        border: solid 2px #${toString colors.base0C};
        border-radius: 50%;
        color: #${toString colors.base0C};
        background: transparent;
        font-size: 10px;
      }

      #custom-spacer {
        margin: 0px 5px 0px 0px;
        padding: 0px;
      }
    '';
  };
}
