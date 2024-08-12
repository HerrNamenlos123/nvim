alias docker-ubuntu-20.04="docker run -it ubuntu:20.04"
alias docker-ubuntu="docker run -it ubuntu"

# General System mappings
alias v="nvim"
alias f="fuck"
alias explorer="explorer.exe ."

# Utility
alias sp="spotify_player"
alias aliases="v ~/.config/nvim/lua/custom/aliases.sh"
alias nvconfig="bash -i -c \"cd ~/.config/nvim/lua/custom && nvim\""
alias bashrc="v ~/.bashrc"

# Git
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias gd="git diff"
alias gr="git reset"

# System folders navigation
alias home="cd ~"
alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"

# TU Graz
alias tug="cd ~/Projects/tugraz"

EDITOR="nvim"
se() {
    sudoedit "$(readlink -f "$1")"
}

alias r="./run"
