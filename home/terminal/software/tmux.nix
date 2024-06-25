{
  programs.tmux = {
    enable = true;
    extraConfig = ''
set -g default-terminal "xterm-256color"
set -ga terminal-overrides ",xterm-256color:Tc"

set-window-option -g mode-keys vi

# anction key
unbind C-b
set-option -g prefix C-t
set-option -g repeat-time 0
set-option -g focus-events on
set-option -g status on

# aliases
set-option -g @xdg-open 'open'
## key bindings

# reload tmux.conf
bind r source ~/.config/tmux/tmux.conf \; display " Reloaded!"
bind o run-shell "nautilus #{pane_current_path}"

# split pane
bind -r s split-window -h -c '#{pane_current_path}'

# kill all panes
bind -r e kill-pane -a

# kill current pane
bind x kill-pane

# duplicate pane
bind -r t run-shell "tmux new-window -c '#{pane_current_path}'"

# kill-server
bind -r q run-shell "tmux kill-server"

# vim-like pane switching
bind -r h select-pane -L 
bind -r j select-pane -D 
bind -r k select-pane -U 
bind -r l select-pane -R

# moving window
bind-key -n C-S-Left swap-window -t -1 \; previous-window
bind-key -n C-S-Right swap-window -t +1 \; next-window

# Resizing pane
bind -r C-h resize-pane -L 5
bind -r C-j resize-pane -D 5
bind -r C-k resize-pane -U 5
bind -r C-l resize-pane -R 5

## basic settings

set -g mouse on
set-option -g status-justify "left"
set-option -g history-limit 64096

set -sg escape-time 10

## colors

# default statusbar colors
set-option -g status-style bg=colour235,fg=colour136,default
# set -g status-style 'bg=#333333 fg=#5eacd3'

# default window title colors
set-window-option -g window-status-style fg=colour244,bg=colour234,dim

# active window title colors
set-window-option -g window-status-current-style fg=colour166,bg=default,bright

# pane border
# set-option -g pane-border-style fg=colour235 #base02
# set-option -g pane-active-border-style fg=colour136,bg=colour235

# message text
set-option -g message-style bg=colour235,fg=colour166

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

# allow the title bar to adapt whatever host you connect to
set -g set-titles on
set -g set-titles-string "#T"

bind-key -T copy-mode-vi 'v' send-keys -X begin-selection
bind-key -T copy-mode-vi 'y' send-keys -X copy-selection

# vim: ft=tmux

set -g message-style "fg=#EE4D5E,bg=#433D61"

set -g status "on"
set -g status-interval 1
set -g status-justify "left"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left '[#S] #(whoamdi)'
set -g status-right "#h "

setw -g window-status-separator ""
setw -g window-status-format '#[normal] #I #{b:pane_current_path} '
setw -g window-status-current-format '#[fg=#EE4D5E,bg=#433D61] #I #{b:pane_current_path} '

set -g pane-border-style "fg=#073642"
set -g pane-active-border-style "fg=#eee8d5"
    '';
  };
}
