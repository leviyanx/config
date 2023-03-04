# set default editor
if [[ -x "$(command -v nvim)" ]]; then
    export EDITOR=nvim
    alias vc="nvim ~/.config/nvim/init.vim"
    alias v="nvim"
else
    echo "Please install nvim, visit this page (https://github.com/neovim/neovim/wiki/Installing-Neovim )"
    export EDITOR=vim
    alias vc="vim ~/.vimrc"
    alias v="vim"
fi

# Simple Aliases
alias gs="git status"
alias gf="git diff"
alias c="clear"
alias la="ls -aG"
alias ll="ls -alhG"
# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias cd..="cd .."

# Create a folder and go into it
#   $ mcd test
mcd() {
    mkdir -p "$1"
    cd "$1"
}

# Save current working directory
marco() {
    export marco_dir=`pwd`
}

# Return back the directory where you executed marco
polo() {
    cd $marco_dir
}
