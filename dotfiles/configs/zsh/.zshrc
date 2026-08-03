export EDITOR=nvim
export VISUAL=nvim

typeset -U path
path=(
	"$HOME/bin/dotfiles/shared"
	"$HOME/.local/bin"
	"/sbin"
	"$PATH"
)

if [[ $(hostname) == "tfserver" ]]; then
	export PATH="$HOME/bin/dotfiles/tfserver:$PATH"
fi

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

# ---------------------------------- plugins --------------------------------- #

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------------- startup --------------------------------- #

if [[ $(hostname) == "tfserver" ]]; then
	services
fi
