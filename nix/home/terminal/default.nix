{pkgs, ...}:{
  imports = [
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
