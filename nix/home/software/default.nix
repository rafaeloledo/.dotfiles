{ config, pkgs, ... }: {

  imports = [
    ./tools
    ./wayland
    ./browsers
    ./xorg
    ./lsp
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
    postman
    postgresql
    pgadmin4
    mysql
    mysql-workbench
    discord
		lazygit
    xfce.thunar
		arduino-ide
  ];

}
