My dotfiles in Linux/MacOS.

How to use?

1. Execute `git init` in `$HOME`.
2. Connect this repo：`git remote add origin git@github.com:leviyanx/config.git`.
3. Make sure that SSH can connect Github.
   - If this is a new system, [set SSH to connect with github](./set_ssh.md).
4. Pull repo：`git pull origin main`.
5. Pull submodule：`git submodule update --init --recursive`.
6. Install `ZSH` and run `zsh`.
7. Waiting...

**Programs/Config included:** (This repo contains a script that will try to install most of these programs **automatically**. However, some programs may require manual installation. You will see their messages on the prompt. You need to follow these messages to install them manually.)

1. [Zsh](https://www.zsh.org/): `.zshrc`
2. [Powerlevel10k](https://github.com/romkatv/powerlevel10k): `.zshrc` and `.p10k.zsh`
3. [Alacritty](https://github.com/alacritty/alacritty): `~/.config/alacritty`
4. (**Deprecated**) [Vim](https://www.vim.org/): `.vimrc` and `.vim`(colors, autoload, after)
5. Settings for [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim): `.ideavimrc`
6. [Ranger](https://github.com/ranger/ranger): `~/.config/ranger`
7. [Lazygit](https://github.com/jesseduffield/lazygit)
   1. macOS: `~/Library/Application support/lazygit`
8. [Neovim](https://neovim.io/): ~~`~/.config/nvim`~~, submodule [nvim](https://github.com/leviyanx/nvim.git)
9. [Clashx](https://github.com/yichengchen/clashX), submodule [clash](https://github.com/leviyanx/clash.git)

Extra

1. [alacritty-theme-switch](https://github.com/tichopad/alacritty-theme-switch): conveniently switch alacritty themes
    1. install: `npm install -g alacritty-theme-switch`
    2. usage: run `alacritty-theme-switch` or `ats`
2. font: [ sauce-code-pro-nerd-font ](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)
    1. install
        1. macOS: `brew tap homebrew/cask-fonts`, `brew install --cask font-sauce-code-pro-nerd-font`
