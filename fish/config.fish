set fish_greeting ""

# options
set fish_user_automatic_suggestion_verbose 1

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# my env variables
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx JAVA_HOME /usr/lib/jvm/default 2>/dev/null

# aliases
alias g git
alias ll "ls -lA"
alias llt "ll --tree"
alias cls "clear"

command -qv neofetch && alias nf neofetch
command -qv nvim && alias v nvim

if type -q tmux
  alias t tmux
  alias ta "tmux a"
  alias td "tmux detach"
end

if type -q eza
  alias ll "eza -lga --icons"
end

if type -q bat
  alias cat "bat -p"
end

# exporting PATHs
# set -gx PATH /home/rgnh55/.local/share/nvim/mason/bin $PATH 2>/dev/null
set -gx PATH bin $PATH 2> /dev/null
set -gx PATH ~/bin $PATH 2> /dev/null
set -gx PATH ~/.local/bin $PATH 2> /dev/null
set -gx PATH /usr/local/bin $PATH 2> /dev/null
set -gx PATH ~/.config/emacs/bin $PATH 2> /dev/null
set -gx PATH ~/.local/scripts $PATH 2> /dev/null
set -gx PATH ~/.cargo/bin $PATH 2> /dev/null
set -gx PATH $ANDROID_HOME/emulator $PATH 2>/dev/null
set -gx PATH $ANDROID_HOME/platform-tools $PATH 2>/dev/null

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# theme
# fish_config theme choose "Rosé Pine" > /dev/null 2> /dev/null
