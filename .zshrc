# ┌────────┐
# │ .zshrc │
# └────────┘

# History settings ============================================================
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_all_dups

# Advanced auto-completion ====================================================
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit

# Prettier prompt =============================================================
autoload -Uz promptinit && promptinit
prompt_simple_setup() { PS1="%F{blue}%~%f> "; }
prompt_themes+=(simple)
prompt simple

# Export stuff ================================================================
export EDITOR="nvim"
export VISUAL="nvim"
PATH="$PATH:$HOME/.local/bin"

# Source config file & plugins ================================================
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh         # shuck: ignore=C003
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # shuck: ignore=C003
if [ -f $HOME/.config/zsh/scripts.zsh ]; then
    source $HOME/.config/zsh/scripts.zsh                                       # shuck: ignore=C003
fi
