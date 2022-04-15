" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named " '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

filetype off " Vundle required

" Functions
" Determinte environment we are runnning on(Win or Linux or Darwin) 
function! WhichEnv() abort
    if has('win64') || has('win32') || has('win16')
        return 'WINDOWS'
    else
        return toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

"Enble searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop> 

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" ESC
inoremap kj <ESC> 

" Map leader to comma
let mapleader = ","

" Split screening
"   Easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Map Tab to 4 Space
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Not extend tab to 4 spaces in Makefile
autocmd FileType make setlocal noexpandtab

" Set python
if (WhichEnv() =~# 'DARWIN')
    " MacOS
    let g:python3_host_prog='/usr/bin/python3'
    let g:python_host_prog='/usr/bin/python'
endif

" Firstly, execute this command: 'git clone https://github.com/VundleVim/Vundle.vim.git
"   ~/.vim/bundle/Vundle.vim'
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle 
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end
" ----------- Add Plugin Declaration Here ----------
" 1 Deoplete(autocomplete)
" 1.1 Require vim8 and python 3.6.1
" 1.2 following settings
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup=1
"   deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" 2 fzf(Fuzzy file finder)
" 2.1 Run this in your shell: 
"   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
"   ~/.fzf/install
" 2.2 following setting
set rtp+=~/.fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"   This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit',}
"   Default fzf layout
"   - down / up / left / right
let g:fzf_layout = {'down': '~40%'}
"   ', space' to open fzf file finder
nnoremap <silent> <leader><space> :Files<CR>

" 3 ag(Silver Searcher)
" 3.1 install ag
" 3.2 following settings
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag -vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" 4 Airline
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enable = 1
" 4.1 set airline 
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnametruncate = 20
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
" 4.2 set key bindings 
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
