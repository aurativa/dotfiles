# ┌─────────┐
# │ Aliases │
# └─────────┘

# Shortcuts ==================================================================
alias py="python"
alias f="fetch"
alias ls="eza --icons always"
alias grep="grep --color"
alias cbat="bat -l conf --style plain"
alias cheat="nvim ~/TeraFS/Resources/Cheatsheet/cheatsheet.md"
alias journal="nvim '$HOME/Documents/Journal/$(date +%F)'"
alias bm="sh $HOME/Projects/shell/useful/common.sh"
alias icat="kitten icat"
alias ytdown="yt-dlp -x --no-playlist --embed-thumbnail "
# alias icat="chafa -f sixel"

# Scripts ====================================================================
alias wallchange="$HOME/Projects/shell/useful/wallchange.sh"
alias fileshort="$HOME/Projects/python/fileshort.py"

# Functions ==================================================================
function pacdate() {
	flatpak update
	yay
}
