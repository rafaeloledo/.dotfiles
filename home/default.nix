{
  lib,
  self,
  config,
  pkgs,
  inputs,
  ... 
}:

{
  imports = [
    ./terminal
    ./software
    ./editors
  ];

  home = {
    username = "rgnh55";
    homeDirectory = "/home/rgnh55";
    stateVersion = "24.05";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}
