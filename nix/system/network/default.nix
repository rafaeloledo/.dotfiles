{ lib, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
    };
    hostName = "nixos";
    useDHCP = lib.mkDefault true;
    nat = {
      enable = true;
    };
    #interfaces.enp2s0.useDHCP = lib.mkDefault true;
    #interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;
  };

}
