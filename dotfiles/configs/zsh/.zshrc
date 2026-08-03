typeset -U path

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

# ---------------------------------- plugins --------------------------------- #

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------------- shared ---------------------------------- #

source "$HOME/bin/dotfiles/shared/shellrc.sh"

# ---------------------------------- startup --------------------------------- #

clear
case "$(hostname)" in
tfserver) services ;;
apollo | viator) hello ;;
esac
