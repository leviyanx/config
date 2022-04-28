#!/usr/bin/env zsh

# proxy setting
export http_proxy="127.0.0.1:12346"
export https_proxy="127.0.0.1:12346"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set Path so that '/usr/local/bin' appears before '/usr/bin'
export PATH="/usr/local/bin:$PATH" 
# python version
export PATH="/usr/local/opt/python@3.10/bin:$PATH" 
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# 0 Automatically install necessary programs
# 0.1 oh-my-zsh
if [[ ! -f "$ZSH/oh-my-zsh.sh" ]]; then
    # Delete .oh-my-zsh folder left by last failure installation to prevent it interfering the process of installing
    rm -rf "$ZSH"
    # install OMZ without replacing .zshrc
    echo "Installing Oh my zsh .."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc
fi

# 0.2 OMZ plugins
# 0.2.1 OMZ plugin: zsh-autosuggestions 
if [[ ! -f "$ZSH_CUSTOM/plugins/zsh-autosuggestions/README.md" ]]; then
    echo "Installing zsh-autosuggestions.."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "Successfually installing zsh-autosuggestions .."
fi

# 0.2.2 OMZ plugin: zsh-syntax-highlighting 
if [[ ! -f "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting/README.md" ]]; then
    echo "Installing zsh-syntax-highlighting.." 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "Successfually installing zsh-syntax-highlighting .."
fi

# 0.2.3 OMZ plugin: zsh-vi-mode 
if [[ ! -f "$ZSH_CUSTOM/plugins/zsh-vi-mode/README.md" ]]; then
    echo "Installing zsh-vi-mode.." 
    git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
    echo "Successfually installing zsh-vi-mode .."
fi

# 0.3 OMZ themes
# 0.3.1 OMZ theme: p10k
if [[ ! -f "$ZSH_CUSTOM/themes/powerlevel10k/README.md" ]]; then
    echo "Installing p10k for OMZ.."
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "Successfually installing p10k(OMZ theme) .."
fi

# 0.4 powerlevel10k
if [[ ! -d "$HOME/powerlevel10k" ]]; then
    echo "Installing p10k.."
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo "Successfully! Please start a new session."
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode)

# zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# 2 Aliases
# 2.1 Simple Aliases
alias gs="git status"
alias gf="git diff"
alias c="clear"
alias v="vim"
alias la="ls -aG"
alias ll="ls -alhG"
alias f="fzf"
# tldr: Install tldr: `sudo npm install -g tldr`
alias tl="tldr"
alias zconf="vim ~/.zshrc"
## 2.1.1 MacOS
alias bs="brew search"
alias bi="brew install"

# 2.2 Global Aliases

# 2.3 Param Aliases
# Git add, an example:
#   $ gd README.md
unalias ga # remove given alias from oh-my-zsh
ga() { git add "$1"; }
# Git commit
# if commit message is null, run "git commit"
# else run "git commit commit_message"
#
# an example:
#   $ gc "init commit"
unalias gc # remove given alias from oh-my-zsh
gc() {
    if [[ -z "$1" ]]; then
        git commit
    else
        git commit -m "$1"
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

# Node version manager for OSX or Linux
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

