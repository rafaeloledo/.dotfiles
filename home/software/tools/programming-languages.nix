{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    nodejs
    lua
    rustup
  ];
}
