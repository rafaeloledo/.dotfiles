{pkgs, ...}: {
  imports = [
    ./emacs
    ./nvim
  ];

  home.packages = with pkgs; [
    helix
    vscode-fhs
    zed-editor
  ];
}
