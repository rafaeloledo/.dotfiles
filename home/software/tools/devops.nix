{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    docker
    staruml
    qemu_full
    libvirt
  ];
}
