{
  lib,
  self,
  config,
  pkgs,
  inputs,
  ... 
}: {
  imports = [
    ./software
    ./terminal
    ./editors
  ];

  home = {
    username = "rgnh55";
    homeDirectory = "/home/rgnh55";
    stateVersion = "24.05";
  };

	home.file = {
		".config/wezterm".source = /mnt/share/.dotfiles/wezterm;
		".config/doom".source = /mnt/share/.dotfiles/doom;
		".config/dunst".source = /mnt/share/.dotfiles/dunst;
		".config/fish".source = /mnt/share/.dotfiles/fish;
		".config/hypr".source = /mnt/share/.dotfiles/hypr;
		".config/i3".source = /mnt/share/.dotfiles/i3;
		".config/nvim".source = /mnt/share/.dotfiles/nvim;
		".config/picom".source = /mnt/share/.dotfiles/picom;
		".config/rofi".source = /mnt/share/.dotfiles/rofi;
		".config/starship".source = /mnt/share/.dotfiles/starship;
		".config/tmux".source = /mnt/share/.dotfiles/tmux;
		".config/viewnior".source = /mnt/share/.dotfiles/viewnior;
		".config/waybar".source = /mnt/share/.dotfiles/waybar;
		".config/yazi".source = /mnt/share/.dotfiles/yazi;
	};

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}
