My dotfiles in Linux/MacOS.

### How to use?

#### Pull Config

1. Execute `git init` in `$HOME`.
2. Connect this repo：`git remote add origin git@github.com:leviyanx/config.git`.
3. Make sure that SSH can connect Github.
   - If this is a new system, [set SSH to connect with github](./set_ssh.md).
4. Pull repo：`git pull origin main`.
5. Pull submodule：`git submodule update --init --recursive`.

#### Install Programs

This repo contains a script that will try to install most of these programs **automatically**. However, some programs may require manual installation. You will see their messages on the prompt. You need to follow these messages to install them manually.

Install [ZSH](https://www.zsh.org/), run `zsh` (its config file is `.zshrc`), and then **wait some programs to be installed**, including:

1. [Powerlevel10k](https://github.com/romkatv/powerlevel10k): `.zshrc` and `.p10k.zsh`
2. [Vim](https://www.vim.org/): `.vimrc` and `.vim`
3. Settings for [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim): `.ideavimrc`
4. fzf 

After installation of programs mentioned above, there are some important programs to be installed **manually**:

1. [Neovim](https://neovim.io/)
   - [submodule - nvim](https://github.com/leviyanx/nvim.git)
2. Nodejs 
   - v14.14.0 (fit the requirement of coc)
      1. Download the corrosponding compressed package from this URL https://nodejs.org/dist/v14.14.0/ .
      2. Extract files from it and rename the folder to `nodejs` (e.g. `node-v14.14.0-linux-x64` -> `nodejs`).
      3. Move this dir into `/usr/local/src`.
   - **DO NOT USE NVM** that slows down zsh.
3. [Ranger](https://github.com/ranger/ranger)
   - `~/.config/ranger`
4. [Autojump](https://github.com/wting/autojump)
   - After installation, **run** 
```bash
source /usr/share/autojump/autojump.zsh
```
5. [Lazygit](https://github.com/jesseduffield/lazygit)
   - macOS: `~/Library/Application support/lazygit`

#### Setup Environment 

TL;DR: Put or link your executable files into `/usr/local/bin` instead of `usr/bin`

Executable files in `/usr/bin` cannot be changed on MacOS, so I set zsh/bash source `/usr/local/bin` before `/usr/bin`, and then executable files in `/usr/local/bin` will cover those in `/usr/bin`.

So, after steps above, you can put or link your executable files into `/usr/local/bin` instead of `/usr/bin`. And you'll be able to enjoy the freedom of changing the environment variables that your work depends on (e.g. python3, nodejs).

---

Environment location

- go: `/usr/local/src`
- nodejs: `/usr/local/src`

### Extra

1. [Alacritty](https://github.com/alacritty/alacritty)
    - `~/.config/alacritty`
2. [alacritty-theme-switch](https://github.com/tichopad/alacritty-theme-switch): conveniently switch alacritty themes
    1. install: `npm install -g alacritty-theme-switch`
    2. usage: run `alacritty-theme-switch` or `ats`
3. font: [ sauce-code-pro-nerd-font ](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/SourceCodePro)
    1. install
        1. macOS: `brew tap homebrew/cask-fonts`, `brew install --cask font-sauce-code-pro-nerd-font`
