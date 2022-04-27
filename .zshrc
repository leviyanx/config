# Automatically install necessary programs
# oh-my-zsh
# powerlevel10k

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set Path so that '/usr/local/bin' appears before '/usr/bin'
export PATH="/usr/local/bin:$PATH" 
# python version
export PATH="/usr/local/opt/python@3.10/bin:$PATH" 

# Aliases
# Simple Aliases
alias gs="git status"
alias gf="git diff"
alias c="clear"
alias v="vim"
alias la="ls -a"
alias ll="ls -l"
## MacOS
alias bs="brew search"
alias bi="brew install"
# Global Aliases

# Para Aliases
# Git add, a command example:
#   $ gd README.md
ga() {
    git add $1
}
# Git commit
# if commit message is null, run "git commit"
# else run "git commit commit_message"
#
# a example:
# $ gc "init commit"
gc() {
    commit_message=$1
    if [[ -z "$commit_message" ]]; then
        git commit
    else
        git commit -m $commit_message
    fi
}
# Create a folder and go into it
#   $ mcd test
mcd() {
    mkdir -p "$1"
    cd "$1"
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
