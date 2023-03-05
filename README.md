My dotfiles in Linux/MacOS.

### How to use?

1. Execute `git init` in `$HOME`.
2. Connect this repo：`git remote add origin git@github.com:leviyanx/config.git`.
3. Make sure that SSH can connect Github.
   - If this is a new system, [set SSH to connect with github](./set_ssh.md).
4. Pull repo：`git pull origin main`.
5. Pull submodule：`git submodule update --init --recursive`.
6. Install `ZSH` and run `zsh`.
7. Waiting...

### Installation of Programs

This repo contains a script that will try to install most of these programs **automatically**. However, some programs may require manual installation. You will see their messages on the prompt. You need to follow these messages to install them manually.

#### Installed Automatically

1. [Powerlevel10k](https://github.com/romkatv/powerlevel10k): `.zshrc` and `.p10k.zsh`
2. [Vim](https://www.vim.org/): `.vimrc` and `.vim`
3. Settings for [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim): `.ideavimrc`
4. fzf 

#### Need to Be Installed Manually

1.[Zsh](https://www.zsh.org/) (mentioned above)
- `.zshrc`

2.[Neovim](https://neovim.io/)
- [submodule - nvim](https://github.com/leviyanx/nvim.git)

3.Nodejs 
- v14.14.0 (fit the requirement of coc)
   1. Download the corrosponding compressed package from this URL https://nodejs.org/dist/v14.14.0/ .
   2. Extract files from it (e.g. `node-v14.14.0-linux-x64`).
   3. Move this dir into `/usr/local/`.
   4. Create soft link of node and npm in it to `/usr/local/bin` (e.g. `sudo ln -s /usr/local/node-v14.14.0-linux-x64/bin/node /usr/local/bin` and `sudo ln -s /usr/local/node-v14.14.0-linux-x64/bin/npm /usr/local/bin`).
- **DO NOT USE NVM** that slows down zsh.

4.[Ranger](https://github.com/ranger/ranger)
- `~/.config/ranger`

5.[Autojump](https://github.com/wting/autojump)
- After installation, **run** 
```bash
source /usr/share/autojump/autojump.zsh
```

6.[Lazygit](https://github.com/jesseduffield/lazygit)
- macOS: `~/Library/Application support/lazygit`

7.[Alacritty](https://github.com/alacritty/alacritty)
- `~/.config/alacritty`

### Extra

1. [alacritty-theme-switch](https://github.com/tichopad/alacritty-theme-switch): conveniently switch alacritty themes
    1. install: `npm install -g alacritty-theme-switch`
    2. usage: run `alacritty-theme-switch` or `ats`
2. font: [ sauce-code-pro-nerd-font ](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)
    1. install
        1. macOS: `brew tap homebrew/cask-fonts`, `brew install --cask font-sauce-code-pro-nerd-font`
