{
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-serif
    ubuntu_font_family
    jetbrains-mono
    fira-code
    nerdfonts
  ];
}
