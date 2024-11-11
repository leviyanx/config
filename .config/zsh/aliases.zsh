# Simple Aliases
alias gs="git status"
alias gf="git diff"
alias c="clear"
alias la="ls -aG"
alias ll="ls -alhG"
alias f="fzf"
alias zc="$EDITOR ~/.zshrc"
alias zload="exec zsh"
alias tc="$EDITOR $HOME/.tmux.conf"
alias tload="tmux source-file $HOME/.tmux.conf"
alias r="ranger"
alias lg="lazygit"
# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
alias cd..="cd .."

## MacOS
if [[ `uname` == "Darwin" ]]; then
    alias brse="brew search"
    alias brin="brew install"
    alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop"
    alias comsol_matlab="/Applications/MATLAB_R2021b.app/bin/matlab"
fi

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
