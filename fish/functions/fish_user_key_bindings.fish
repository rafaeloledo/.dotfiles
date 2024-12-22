function fish_user_key_bindings
		bind \cz 'fg; commandline -f repaint'
    bind \cf tmux_sessionizer
    # vim like
    bind \el forward-char
    bind \ek up-char
    #bind \; 'echo -e "\n"; ll; commandline -f repaint'
    #bind \' 'echo -e "\n"; lt; commandline -f repaint'
    bind \cd 'commandline cd '

    bind \co yazi
    bind \cd delete-char
    bind \cl 'clear; commandline -f repaint'
    # ctrl-backspace
    bind \b backward-kill-word
    # ctrl-delete
    bind \e\[3\;5~ kill-word
end
