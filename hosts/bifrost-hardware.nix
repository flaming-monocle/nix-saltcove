{ config, lib, pkgs, modulesPath, ... }:
let
  kver = config.boot.kernelPackages.kernel.version;
in
{
  imports = [
    # ref GitHub:NixOS/nixos-hardware

    # CPU
    ./hardware/cpu/intel/default.nix
    
    # Intel integrated GPU
    ./hardware/gpu/intel/default.nix
    ./hardware/gpu/intel/kaby-lake.nix

    # SSD
    ./hardware/ssd/default.nix

    # Laptop
    ./hardware/laptop/default.nix
    ./hardware/t480s/default.nix

    #-- SYSTEM GENERATED --#
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  
  #-- SYSTEM GENERATED --#
  #imports = [
  #  (modulesPath + "/installer/scan/not-detected.nix")
  #];
  
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1a3e5e6c-5498-4da1-8def-dc9103662a78";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/23E8-D76E";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/be919c5b-0ff0-41f2-ab8a-35fdd7ca5d71"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
