这是同步我配置文件的仓库。

如何使用本仓库的配置：

1. 在家目录 `$HOME`下执行 `git init`。
2. 更改branch的名字：`git branch -m main`。
3. 连接本仓库：`git remote add origin git@github.com:leviyanx/config.git`。
4. 拉取配置：`git pull origin main`。
5. 拉取子项目：`git submodule update --init --recursive`

包括哪些配置：

1. [Zsh](https://www.zsh.org/): `.zshrc`
2. [Powerlevel10k](https://github.com/romkatv/powerlevel10k): `.zshrc` and `.p10k.zsh`
3. [Alacritty](https://github.com/alacritty/alacritty): `~/.config/alacritty`
4. (Deprecated) [Vim](https://www.vim.org/): `.vimrc` and `.vim`(colors, autoload, after)
5. Settings for [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim): `.ideavimrc`
6. [Ranger](https://github.com/ranger/ranger): `~/.config/ranger`
7. [Lazygit](https://github.com/jesseduffield/lazygit)
   1. macOS: `~/Library/Application support/lazygit`
8. [Neovim](https://neovim.io/): ~~`~/.config/nvim`~~, submodule [nvim](https://github.com/leviyanx/nvim.git)

Extra

1. [alacritty-theme-switch](https://github.com/tichopad/alacritty-theme-switch): conveniently switch alacritty themes
    1. install: `npm install -g alacritty-theme-switch`
    2. usage: run `alacritty-theme-switch` or `ats`
2. font: [ sauce-code-pro-nerd-font ](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)
    1. install
        1. macOS: `brew tap homebrew/cask-fonts`, `brew install --cask font-sauce-code-pro-nerd-font`
