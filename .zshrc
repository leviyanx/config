#!/usr/bin/env zsh

# Get profiling information(more detailed load time) by running: 'zprof'
zmodload zsh/zprof

# resolve the problem of compinit spending too much time
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# proxy setting
export http_proxy="127.0.0.1:12346"
export https_proxy="127.0.0.1:12346"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set Path so that '/usr/local/bin' appears before '/usr/bin'
export PATH="/usr/local/bin:$PATH" 
export PATH="$PATH:$HOME/.local/bin"
# set default editor
if [[ -x "$(command -v nvim)" ]]; then
    export EDITOR=nvim
    alias vconf="nvim ~/.config/nvim/init.vim"
    alias nv="nvim"
    alias v="nvim"
else
    echo "Please install nvim, visit this page (https://github.com/neovim/neovim/wiki/Installing-Neovim )"
    export EDITOR=vim
    alias vconf="vim ~/.vimrc"
    alias nv="vim"
    alias v="vim"
fi
# python version
export PATH="/usr/local/opt/python@3.10/bin:$PATH" 
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
export ZSH_THEMES="$HOME/.oh-my-zsh/custom/themes"
# Add default node to path (to skip NVM checking time )
export PATH=~/.nvm/versions/node/v18.0.0/bin:$PATH
# Node version manager for OSX or Linux
# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ranger
# only load custom configs
export RANGER_LOAD_DEFAULT_RC=FALSE

# guest machine settings
if [[ ! -f "$HOME/.guest-machine-settings.sh" ]]; then
    while true; do
        # ask if this is a guest machine
        vared -p "Is this a guest machine (not your host machine), y/n: " -c ans
        if [[ "y" == $ans ]]; then
            # this is a guest machine
            # write settings into the setting file
            echo "unset http_proxy" > "$HOME/.guest-machine-settings.sh"
            echo "unset https_proxy" >> "$HOME/.guest-machine-settings.sh"
            echo "\nGuest machine settings are finished."
            # remind to install some necessary programs
            echo "Then please install: python 3.10, node 18.0.0\n"
            break
        elif [[ "n" == $ans ]]; then
            # this is a host machine
            echo "" > "$HOME/.guest-machine-settings.sh"
            echo "\nGuest machine settings are finished."
            break
        else
            echo "\nPlease delete your input, and enter y or n.\n"
            continue
        fi
    done
fi
source ~/.guest-machine-settings.sh

# 0 Automatically install necessary programs
# 0.1 oh-my-zsh
if [[ ! -f "$ZSH/oh-my-zsh.sh" ]]; then
    # Delete .oh-my-zsh folder left by last failure installation to prevent it interfering the process of installing
    rm -rf "$ZSH"
    
    # manually install OMZ without replacing .zshrc
    echo "Installing Oh my zsh .."
    echo "======================="
    echo -e "Or if you want to install it manually(especially in a custom machine that lack proxy, \nexecute these commands: \n(1) git clone https://gitee.com/mirrors/oh-my-zsh.git ~/oh-my-zsh \n(2) sh -c ~/oh-my-zsh/tools/install.sh "" --keep-zshrc \n(3) rm -rf ~/oh-my-zsh \nNote: Maybe OMZ backup .zshrc to .zshrc.pre-oh-my-zsh, you should delete the new .zshrc \nand restore original .zshrc."
    echo "============================"

    # automacally install OMZ without replacing .zshrc
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
if [[ ! -d "$HOME/powerlevel10k" ]]; then
    echo "Installing p10k.."
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo "Successfully! Please start a new session."
fi

# 0.4 Shell tools
install_npm_suggestion="If haven't installed npm, you can use nvm to install it, visit this page to learn how install nvm \n(https://github.com/nvm-sh/nvm#installing-and-updating ), then run 'nvm install node' to install npm\nAfter that, if this is a host machine, execute: npm config set proxy http://127.0.0.1:12346"
# 0.4.1 fzf (support vim plugin)
if [[ ! -f "$HOME/.fzf/README.md" ]]; then
    echo "Installing fzf .."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "Successfully install fzf"
fi
# 0.4.2 bat
if [[ ! -x "$(command -v bat)" ]]; then
    echo "Please install bat, vist this page (https://github.com/sharkdp/bat )"
fi
# 0.4.3 tldr
if [[ ! -x "$(command -v tldr)" ]]; then
    echo "Please install tldr, run command: 'sudo npm install -g tldr'"
    echo -e $install_npm_suggestion
fi
# 0.4.4 ripgrep (support vim plugin)
if [[ ! -x "$(command -v rg)" ]]; then
    echo "Please install ripgrep, visit this page (https://github.com/BurntSushi/ripgrep#installation )"
fi
# 0.4.5 fd (alternative to find)
if [[ ! -x "$(command -v fd)" ]]; then
    echo "Please install fd. If you use MacOS, you can install it with brew, otherwise visit this page (https://github.com/sharkdp/fd )"
fi
# 0.4.6 tmux
if [[ ! -x "$(command -v tmux)" ]]; then
    echo "Please install tmux. visit this page (https://github.com/tmux/tmux#installation )"
fi
# 0.4.7 ranger
if [[ ! -x "$(command -v ranger)" ]]; then
    echo "Please install ranger, install it through Pypl: pip install ranger-fm, or visit this page (https://github.com/ranger/ranger#installing ) to learn other methods"
fi
# 0.4.8 lazygit
if [[ ! -x "$(command -v lazygit)" ]]; then
    echo "Please install lazygit, visit this page (https://github.com/jesseduffield/lazygit#installation )"
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
plugins=(git)
plugins+=(zsh-autosuggestions)
plugins+=(zsh-syntax-highlighting)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj # map kj to <Esc> in insert mode
ZVM_VI_VISUAL_ESCAPE_BINDKEY=kj # map kj to <Esc> in visual mode
# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
    # fzf
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # autojump
    [[ -s "$HOME/.autojump/etc/profile.d/autojump.sh" ]] && source "$HOME/.autojump/etc/profile.d/autojump.sh"
    # detect autojump installation
    if [[ ! -x "$(command -v autojump)" ]]; then
        echo "Please install autojump, visit this page (https://github.com/wting/autojump#manual )"
    fi
}

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
alias la="ls -aG"
alias ll="ls -alhG"
alias f="fzf"
alias tl="tldr"
alias zconf="$EDITOR ~/.zshrc"
alias zload="exec zsh"
alias tconf="$EDITOR $HOME/.tmux.conf"
alias tload="tmux source-file $HOME/.tmux.conf"
alias r="ranger"
alias lg="lazygit"
# Overwrite existing commands for better defaults
alias mv="mv -i"           # -i prompts before overwrite
alias mkdir="mkdir -p"     # -p make parent dirs as needed
alias df="df -h"           # -h prints human readable format
## 2.1.1 MacOS
if [[ `uname` == "Darwin" ]]; then
    alias brse="brew search"
    alias brin="brew install"
    alias matlab="/Applications/MATLAB_R2021b.app/bin/matlab -nodesktop"
    alias comsol_matlab="/Applications/MATLAB_R2021b.app/bin/matlab"
fi

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
# To test my zsh load time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
# cd "My Drive"
cg() {
    cd "$HOME/My Drive"
}
# Save current working directory
marco() {
    export marco_dir=`pwd`
}
# Return back the directory where you executed marco
polo() {
    cd $marco_dir
}

# fzf
# key bindings for command-line
# 1) find file or directory (using fd with fzf)
export FZF_DEFAULT_COMMAND="fd" # vim also use fd with fzf

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--height=50% --layout=reverse --inline-info --border "
# toggling between data sources
FZF_CTRL_T_OPTS+="--prompt 'All> ' "
FZF_CTRL_T_OPTS+="--header 'CTRL-D: Directories / CTRL-F: Files' "
FZF_CTRL_T_OPTS+="--bind 'ctrl-d:change-prompt(Directories> )+reload(fd --type directory --hidden --no-ignore)' "
FZF_CTRL_T_OPTS+="--bind 'ctrl-f:change-prompt(Files> )+reload(rg --files --no-ignore --hidden)' "
# enable preview
FZF_CTRL_T_OPTS+="--preview 'bat --color=always --style=numbers,changes --line-range :300 {}'"

# 2) history using fzf
export FZF_CTRL_R_OPTS="--height=50% --layout=reverse --inline-info --border "
FZF_CTRL_R_OPTS+="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

# 3) fzf completion
# Use \ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\'
# Options to fzf command
export FZF_COMPLETION_OPTS='--height=50% --border --info=inline'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# ranger: shell changes the directory only when quitting ranger with keybinding capital Q
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}
