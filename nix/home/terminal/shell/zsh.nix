{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    dotDir = ".config/zsh";

    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" "brackets" "pattern" "cursor" "regexp" "root" "line" ];
    };

    shellGlobalAliases = {
      eza = "eza --icons --git";
    };

    shellAliases = {
      g = "git";
      cls = "clear";
      ff = "fastfetch";
      v = "nvim";
      t = "tmux";
      ta = "tmux a";
      td = "tmux detach";
      ll = "eza -lga --icons";
      cat = "bat --theme=\"Solarized (dark)\" --number --color=always --paging=never --tabs=2 --wrap=never";
      home-build = "home-manager build --flake /mnt/kingston/dotfiles-nix";
      home-switch = "home-manager switch --flake /mnt/kingston/dotfiles-nix -b backup";
    };
  };
}
