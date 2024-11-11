# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
export ZSH_THEMES="$HOME/.oh-my-zsh/custom/themes"

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
    echo "Please install tldr, run command: 'npm install -g tldr'" 
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

## ranger
# only load custom configs
export RANGER_LOAD_DEFAULT_RC=FALSE
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
