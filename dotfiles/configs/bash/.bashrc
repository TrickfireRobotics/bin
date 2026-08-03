export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/bin/dotfiles/shared:$HOME/.local/bin:/sbin:$PATH"

if [[ $(hostname) == "tfserver" ]]; then
	export PATH="$HOME/bin/dotfiles/tfserver:$PATH"
fi

case "$(hostname)" in
tfserver) export STARSHIP_CONFIG="$HOME/bin/dotfiles/starship/tfserver.toml" ;;
apollo) export STARSHIP_CONFIG="$HOME/bin/dotfiles/starship/apollo.toml" ;;
viator) export STARSHIP_CONFIG="$HOME/bin/dotfiles/starship/viator.toml" ;;
esac

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

# ---------------------------------- aliases --------------------------------- #

alias c='clear'
alias d='trash'
alias s='clear && services'
alias n='clear && fastfetch'
alias ls='echo && eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias lsa='echo && eza --color=always --long --git --icons=always'
alias lsaa='echo && eza --color=always --long --git --icons=always -a'
alias lst='echo && eza --color=always --tree --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias cd='z'

# ---------------------------------- plugins --------------------------------- #

eval "$(starship init bash)"
eval "$(zoxide init bash)"
