{ config, lib, modulesPath, ... }:
let 
  kver = config.boot.kernelPackages.kernel.version;
in
{
  # github: NixOS/nixos-hardware
  # .../common/cpu/amd-cpu
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  boot = lib.mkMerge [
    (lib.mkIf ((lib.versionAtLeast kver "5.17") && (lib.versionOlder kver "6.1")) {
      kernelParams = [ "initcall_blacklist=acpi_cpufreq_init" ];
      kernelModules = [ "amd-pstate" ];
    })
    (lib.mkIf ((lib.versionAtLeast kver "6.1") && (lib.versionOlder kver "6.3")) {
      kernelParams = [ "amd_pstate=passive" ];
    })
    (lib.mkIf (lib.versionAtLeast kver "6.3") {
      kernelParams = [ "amd_pstate=active" ];
    })
  ];

  # .../common/gpu/nvidia-gpu
  services.xserver.videoDrivers = lib.mkDefault ["nvidia" ];

  # src/common/pc/ssd
  services.fstrim.enable = lib.mkDefault true;

  #-- SYSTEM GENERATED --#
  imports = [
   (modulesPath + "/installer/scan/not-detected.nix")
  ];

  #boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "sd_mod" ];
  #boot.initrd.kernelModules = [ ];
  #boot.kernelModules = [ "kvm-amd" ];
  #boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/59e119e4-9065-4b61-b38a-e5a1bd4d57fb";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4FC8-B11A";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/games" =
    { device = "/dev/disk/by-uuid/16b92132-5dc1-45d3-93c5-df97c943685e";
      fsType = "ext4";
    };

  fileSystems."/media" =
    { device = "/dev/disk/by-uuid/ddade6e5-b251-44ec-968d-cba75eec60f6";
      fsType = "ext4";
    };

  fileSystems."/home/kobi/Media" =
    { device = "/media";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/home/kobi/Games" =
    { device = "/games";
      fsType = "none";
      options = [ "bind" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/206ee27e-abc1-414f-abcf-c34cea1251a8"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
} 
