# ┌────────┐
# │ .zshrc │
# └────────┘

# History settings ============================================================

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_all_dups

if [ -f ~/.calc_history ]; then
    rm ~/.calc_history
fi

# Advanced auto-completion ====================================================

zstyle :compinstall filename '/home/lara/.zshrc'
autoload -Uz compinit && compinit

# Prettier prompt ===========================================(~ : )============

autoload -Uz promptinit && promptinit
prompt_simple_setup() { PS1="%F{blue}%~%f> "; }
prompt_themes+=(simple)
prompt simple

# Export stuff ================================================================

export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="/usr/bin/foot"
PATH="$PATH:/home/lara/.local/bin"

# Better yazi =================================================================

function y() {
	local tmp cwd
	tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd <"$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

# Source config file & plugins ==============================(zoxide!)=========

eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh         # shuck: ignore=C003
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # shuck: ignore=C003
source $HOME/.config/zsh/aliases.zsh                                       # shuck: ignore=C003

export PATH=$PATH:/home/lara/.spicetify
