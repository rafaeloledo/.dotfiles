{ config, lib, pkgs, ... }:

{
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    openssh.enable = true;
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      xkb.layout = "us,br";
      xkb.variant = "";
			xkb.options= "ctrl:nocaps";
      videoDrivers = [ "nvidia" ];
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
      touchpad = {
        accelProfile = "flat";
      };
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
