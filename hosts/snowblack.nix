{ pkgs, ... }:
{
  # Settings apply to all users in host
  imports = [ 
    # Host Settings
    ./snowblack-hardware.nix
    ./../configuration/default.nix
    ./../configuration/gaming.nix
    ./../configuration/dolphin.nix

    # User Settings
    ./../users/kobi.nix
    ./../users/carlisle.nix

    # Extra Host-Wide Configs

  ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    pamixer
    alsa-plugins
    alsa-utils
    scarlett2
    alsa-scarlett-gui
    openrgb-with-all-plugins
  ];

  home-manager.users.kobi = {
    # Host- AND user-specific settings
  };
  home-manager.users.carlisle = {
    # Host- AND user-specific settings
  };

  # Hostname
  networking.hostName = "snowblack";

  # Boot options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # OpenRGB
  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  # Sound
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      extraConfig.pipewire."92-low-latency" = {
        "context-properties" = {
      	  "default.clock.rate" = 48000;
      	  "default.clock.quantum" = 1024;
      	  "default.clock.min-quantum" = 512;
    	    "default.clock.max-quantum" = 2048;
        };
      };
    };
  };

  boot.extraModprobeConfig = ''
    options snd_usb_audio vid=0x1235 pid=0x8211 device_setup=1
  '';
}
