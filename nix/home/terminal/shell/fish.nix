{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
    functions = {
      fish_user_key_bindings = {
        body = ''
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
      set -gx PATH ~/.nix-profile/bin $PATH 2>/dev/null

      zoxide init fish | source
      starship init fish | source
    '';
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
