{pkgs, ...}:{
  imports = [
    ./shell/fish.nix
    ./shell/bash.nix
    ./shell/zsh.nix
    ./software
  ];

	home.packages = with pkgs; [
		starship
		wezterm
		# fish
		# zsh
	];
}
