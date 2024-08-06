{
  pkgs,
  ...
}:

{
  imports = [ ./git.nix ];

  home.packages = with pkgs; [
    ngrok
    unixtools.xxd
    fastfetch
    docker
    staruml
    qemu_full
    libvirt
    mtpfs
    android-file-transfer
    android-udev-rules
    libmtp
    jq
    chromium
		stow
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
			autoconnect = ["qemu:///system"];
			uris = ["qemu:///system"];
    };
  };
}
