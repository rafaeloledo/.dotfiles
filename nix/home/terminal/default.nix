{pkgs, ...}:{
  imports = [
    ./shell/bash.nix
    ./shell/zsh.nix
  ];

	home.packages = with pkgs; [
		starship
		wezterm
	];
}
