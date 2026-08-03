# ----------------------------------- opts ----------------------------------- #

HISTFILE=~/.bash_history
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
bind 'set completion-ignore-case on'

shopt -s autocd

set -o emacs
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[1;5C": forward-word'
bind '"\e[1;5D": backward-word'

# ----------------------------------- shared ---------------------------------- #

source "$HOME/bin/dotfiles/shared/shellrc.sh"

# ---------------------------------- startup --------------------------------- #

clear
case "$(hostname)" in
apollo | viator) hello ;;
esac
