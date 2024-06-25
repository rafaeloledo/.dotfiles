{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-cjk-serif
  ];
}
