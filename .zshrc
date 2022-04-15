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
alias c="clear"
alias v="vim"
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
# Git commit, a command example: 
#   $ gc "This is a commit"
gc() {
    git commit -m $1
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
