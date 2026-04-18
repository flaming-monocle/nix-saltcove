{ config, pkgs, ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "top";
      control-center-margin-top = 10;
      control-center-margin-bottom = 10;
      control-center-margin-right = 10;
      control-center-width = 500;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
    };
    style = ''
      .notification-row {
        outline: none;
      }
      .notification-content {
        background: #1a1b26;
        color: #c0caf5;
        padding: 10px;
        border-radius: 10px;
        border: 1px solid #7aa2f7;
      }
      .control-center {
        background: rgba(26, 27, 38, 0.95);
        border-radius: 15px;
        border: 1px solid #7aa2f7;
        padding: 20px;
      }
    '';
  };
}
