export EDITOR=nvim
export VISUAL=nvim

typeset -U path
path=(
	"$HOME/bin/dotfiles/shared"
	"$HOME/.local/bin"
	"/sbin"
	$path
)

case "$(hostname)" in
tfserver)
	export PATH="$HOME/bin/dotfiles/tfserver:$PATH"
	export STARSHIP_CONFIG="$HOME/bin/dotfiles/starship/tfserver.toml"
	;;
apollo)
	export PATH="$HOME/bin/dotfiles/apollo:$PATH"
	export STARSHIP_CONFIG="$HOME/bin/dotfiles/starship/apollo.toml"
	;;
viator)
	export PATH="$HOME/bin/dotfiles/viator:$PATH"
	export STARSHIP_CONFIG="$HOME/bin/dotfiles/starship/viator.toml"
	;;
esac

# ----------------------------------- opts ----------------------------------- #

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups hist_ignore_space

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd

bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

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
alias ssh='TERM="xterm-256color" ssh'

# ---------------------------------- plugins --------------------------------- #

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------------- startup --------------------------------- #

clear
case "$(hostname)" in
tfserver) services ;;
apollo | viator) hello ;;
esac
