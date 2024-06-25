{inputs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    pamixer
    waybar
    grim
    slurp
    dunst
    swaybg
    anyrun
    wl-clipboard
    hyprpicker
    xfce.thunar
    wlogout
    hyprpaper
  ];
}
