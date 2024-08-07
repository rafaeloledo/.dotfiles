function _fzf_wrapper --description "Prepares some environment variables before executing fzf."
    # Make sure fzf uses fish to execute preview commands, some of which
    # are autoloaded fish functions so don't exist in other shells.
    # Use --function so that it doesn't clobber SHELL outside this function.
    set -f --export SHELL (command --search fish)

    # If neither FZF_DEFAULT_OPTS nor FZF_DEFAULT_OPTS_FILE are set, then set some sane defaults.
    # See https://github.com/junegunn/fzf#environment-variables

    # cycle allows jumping between the first and last results, making scrolling faster
    # layout=reverse lists results top to bottom, mimicking the familiar layouts of git log, history, and env
    # border shows where the fzf window begins and ends
    # height=90% leaves space to see the current command and some scrollback, maintaining context of work
    # preview-window=wrap wraps long lines in the preview window, making reading easier
    # marker=* makes the multi-select marker more distinguishable from the pointer (since both default to >)
    set --export FZF_DEFAULT_OPTS '
      --cycle
      --layout=reverse
      --border
      --height=90%
      --preview-window=wrap
      --marker="*"
      --preview-window="border-rounded"
      --preview-window="60%"
      --border="rounded"
      --bind="ctrl-d:preview-page-down"
      --bind="ctrl-u:preview-page-up"
      --height="100%"
    '

    fzf $argv
end
