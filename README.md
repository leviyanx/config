这是同步我配置文件的仓库。

如何使用本仓库的配置：

1. 在家目录 `$HOME`下执行 `git init`。
2. 更改branch的名字：`git branch -m main`。
3. 连接本仓库：`git remote add origin git@github.com:leviyanx/config.git`。
4. 拉取配置：`git pull origin main`。

包括哪些配置：

1. [Zsh](https://www.zsh.org/): `.zshrc`
2. [Powerlevel10k](https://github.com/romkatv/powerlevel10k): `.zshrc` and `.p10k.zsh`
3. [Alacritty](https://github.com/alacritty/alacritty): `~/.config/alacritty`
4. [Vim](https://www.vim.org/): `.vimrc` and `.vim`(colors, autoload, after)
5. Settings for [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim): `.ideavimrc`
6. [Ranger](https://github.com/ranger/ranger): `~/.config/ranger`
7. [Lazygit](https://github.com/jesseduffield/lazygit)
   1. macOS: `~/Library/Application support/lazygit`
