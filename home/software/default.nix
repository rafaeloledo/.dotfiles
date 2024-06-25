{ config, pkgs, ... }: {

  imports = [
    ./wayland
    ./tools
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    brave
    google-chrome
    psensor
    inkscape-with-extensions
    vlc
    obs-studio 
  ];
}
