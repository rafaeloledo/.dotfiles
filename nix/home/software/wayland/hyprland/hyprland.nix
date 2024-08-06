{inputs, pkgs, ...}: {
  home.packages = with pkgs; [
    pavucontrol
    pamixer
    waybar
    grim
    slurp
    swaybg
    anyrun
    wl-clipboard
    hyprpicker
    xfce.thunar
    wlogout
    hyprpaper
  ];
}
