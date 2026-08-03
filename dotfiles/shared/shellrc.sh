export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/bin/dotfiles/shared:$HOME/.local/bin:/sbin:$PATH"

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

if [ -n "$ZSH_VERSION" ]; then
	eval "$(starship init zsh)"
	eval "$(zoxide init zsh)"
else
	eval "$(starship init bash)"
	eval "$(zoxide init bash)"
fi
