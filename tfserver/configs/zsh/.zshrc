# PATH
export PATH="$HOME/bin/tfserver/bin:$HOME/.local/bin:$PATH:/sbin"

# Starship prompt
eval "$(starship init zsh)"

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups hist_ignore_space

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Key bindings
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# zoxide
eval "$(zoxide init zsh)"

# Aliases
alias c='clear'
alias d='trash'
alias s='clear && services'
alias n='clear && fastfetch'
alias ls='echo && eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias lsa='echo && eza --color=always --long --git --icons=always'
alias lsaa='echo && eza --color=always --long --git --icons=always -a'
alias lst='echo && eza --color=always --tree --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias cd='z'

# Misc
setopt auto_cd

# Plugins (syntax-highlighting must be last)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Show service status on login
services

