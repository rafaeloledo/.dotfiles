{ lib, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
    };
    hostName = "nixos";
    useDHCP = lib.mkDefault true;
    #interfaces.enp2s0.useDHCP = lib.mkDefault true;
    #interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;
  };

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    openssh.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      videoDrivers = [ "nvidia" ];
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
