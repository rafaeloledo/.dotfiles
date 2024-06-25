{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
    functions = {
      fish_user_key_bindings = {
        body = ''
          # peco
          # bind \cr peco_select_history
          # bind \cf tmux-sessionizer
          # vim like
          bind \el forward-char

          bind \co yazi
          bind \cd delete-char
          bind \cl 'clear; commandline -f repaint'
          # ctrl-backspace
          bind \b backward-kill-word
          # ctrl-delete
          bind \e\[3\;5~ kill-word
        '';
      };
    };
    shellInit = ''
      set fish_greeting ""

      set fish_user_automatic_suggestion_verbose 1

      set -g theme_color_scheme terminal-dark
      set -g fish_prompt_pwd_dir_length 1
      set -g theme_display_user yes
      set -g theme_hide_hostname no
      set -g theme_hostname always

      set -gx EDITOR nvim
      set -gx XDG_CONFIG_HOME $HOME/.config
      set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
      set -gx ANDROID_HOME $HOME/Android/Sdk
      set -gx JAVA_HOME /usr/lib/jvm/default 2>/dev/null

      set -gx PATH bin $PATH 2>/dev/null
      set -gx PATH ~/bin $PATH 2>/dev/null
      set -gx PATH ~/.local/bin $PATH 2>/dev/null
      set -gx PATH /usr/local/bin $PATH 2>/dev/null
      set -gx PATH ~/.config/emacs/bin $PATH 2>/dev/null
      set -gx PATH ~/.local/scripts $PATH 2>/dev/null
      set -gx PATH ~/.cargo/bin $PATH 2>/dev/null
      set -gx PATH $ANDROID_HOME/emulator $PATH 2>/dev/null
      set -gx PATH $ANDROID_HOME/platform-tools $PATH 2>/dev/null
    '';
    shellAliases = {
      g = "git";
      cls = "clear";
      nf = "neofetch";
      v = "nvim";
      t = "tmux";
      ta = "tmux a";
      td = "tmux deatch";
      ll = "eza -lga --icons";
      cat = "bat -p";
      c = "clear";
      q = "exit";
      y = "yazi";
      installed = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq | sk";
      installedall = "nix-store --query --requisites /run/current-system | sk";
      cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
      listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-genereations";
      temp = "cd ~/tmp/";
      test-build = "sudo nixos-rebuild test --flake .";
      switch-build = "sudo nixos-rebuild switch --flake .";
    };
  };
}
