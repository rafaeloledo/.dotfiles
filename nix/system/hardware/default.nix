{ config, lib, pkgs, modulesPath, ... }:

{ 
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems."/" =
  {
    device = "/dev/disk/by-uuid/57bf9c8d-322a-4479-b1da-1d82d69ef2df";
    fsType = "ext4"; 
  };
  fileSystems."/boot" =
  {
    device = "/dev/disk/by-uuid/7EB6-C7D5";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };
  fileSystems."/mnt/share" =
  {
    device = "/dev/disk/by-uuid/9df36583-2709-4e1c-ae2d-104607c98528";
    fsType = "ext4";
  };
  fileSystems."/mnt/share1" = {
    device = "/dev/disk/by-uuid/1a6f4a0a-6af6-4c29-b69e-34a6738a420f";
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
