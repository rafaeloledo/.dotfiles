{
	imports = [
		./i3.nix
	];

	virtualisation.docker = {
		enable = true;
		daemon.settings = {
			data-root = "/mnt/share/docker-img";
		};
	};
	users.users.rgnh55.extraGroups = [ "docker" ];
}
