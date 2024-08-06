{ config, lib, pkgs, modulesPath, ... }:

{ 
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems."/" =
  {
    device = "/dev/disk/by-uuid/0e6faccb-a8d5-4acf-89d6-22972e6b755f";
    fsType = "ext4"; 
  };
  fileSystems."/boot" =
  {
    device = "/dev/disk/by-uuid/31FC-C493";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };
  fileSystems."/mnt/kingston" =
  {
    device = "/dev/disk/by-uuid/9df36583-2709-4e1c-ae2d-104607c98528";
    fsType = "ext4";
  };

  swapDevices = [ ];

  hardware = {
    #pulseaudio.enable = true;
    graphics.enable = true;
		bluetooth.enable = true;
		bluetooth.powerOnBoot = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        sync.enable = true;
        # offload = {
        #   enable = true;
        #   enableOffloadCmd = true;
        # };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "vmd" "ahci" "nvme" "uas" "sd_mod" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

	services.blueman.enable = true;
}
