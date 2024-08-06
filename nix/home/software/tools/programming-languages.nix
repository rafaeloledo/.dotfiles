{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nodejs
    lua
    rustup
    pipx

    php

    nodePackages.pnpm
  ];
}
