" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named " '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

filetype off " Vundle required

" Functions
" 1. Determinte environment we are runnning on(Win or Linux or Darwin) 
function! WhichEnv() abort
    if has('win64') || has('win32') || has('win16')
        return 'WINDOWS'
    else
        return toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction
" Execuate this function only once to reduce start time
let env = WhichEnv()

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

" Map kj to ESC
inoremap kj <Esc> " press kj to exit insert mode
vnoremap kj <Esc> " press kj to exit visual mode

" Map leader to comma
let mapleader = ","
let localleader = ","

" Map Tab to 4 Space
filetype plugin indent on
set tabstop=4       " show existing tab with 4 spaces width
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " spaces in newline start
set expandtab       " On pressing tab, insert 4 spaces
" Not extend tab to 4 spaces in Makefile
autocmd FileType make setlocal noexpandtab

" Map shift-tab to inverse tab for insert mode
inoremap <S-Tab> <C-d> 

" Split screening
set splitbelow
set splitright
nnoremap ,x1 <C-W>o
nnoremap ,x2 :split<CR>
nnoremap ,x3 :vsplit<CR>
nnoremap ,x0 :q<CR>
" move window
nnoremap ,wh <C-W>h
nnoremap ,wl <C-W>l
nnoremap ,wj <C-W>j
nnoremap ,wk <C-W>k

" Use a line cursor within insert mode and a block cursor everything else
"
" Reference chart of values:
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Rename variable
" (1) Place cursor at name to rename and type
" (2) For local replace/ global repalce
" `gr`/`gR` then type new name + <esc> to rename variable declaration, then use `.` to rename next occurrence(s)
" or `:%norm .` to rename all occurrence in the buffer at once.
nnoremap gr gdcgn
nnoremap gR gDcgn

set cursorline " highlight current line

set wildmenu    " visual autocomplete for command menu
set showmatch   " highlight matching [{()}]j

" make vim paste from (and copy to) system's clipboard
set clipboard=unnamed

" copy file name/path of current buffer in vim to system clipboard
" full path
nnoremap <leader>fn :let @*=expand("%:p")<CR>
" filename
nnoremap <leader>fp :let @*=expand("%:t")<CR>

" Specific platform setting
" MacOS
if env == 'DARWIN'
    " Set python
    let g:python_host_skip_check = 1 " skip check to speed up loading
    let g:python_host_prog='/usr/bin/python'
    let g:python3_host_skip_check = 1 " skip check to speed up loading
    let g:python3_host_prog='/usr/bin/python3'
    " racer cmd path
    let cross_platform_racer_cmd = "/User/leviyan/.cargo/bin/racer"
elseif env == "WINDOWS"
    " Set python
    " racer cmd path
    " let cross_platform_racer_cmd = "/User/leviyan/.cargo/bin/racer"
elseif env == "Linux"
    let cross_platform_racer_cmd = "/User/leviyan/.cargo/bin/racer"
endif

" START - Setting up Vim-Plug
call plug#begin('~/.vim/plugged')

" Keep Plugin commands between plug#begin/end
" ----------- Add Plugin Declaration Here ----------
" 1 YouCompleteMe
" Visit this page(https://github.com/ycm-core/YouCompleteMe) to complete YCM installation
Plug 'Valloric/YouCompleteMe', { 'on': [] }
" Lazy load: load YCM until press `i`(to insert)
let g:YouCompleteMeLazyLoaded = 0
function! LazyLoadingYMC()
    if g:YouCompleteMeLazyLoaded == 0
        g:YouCompleteMeLazyLoaded = 1
        call plug#load('YouCompleteMe') | call youcompleteme#Enable()
    endif
endfunction
autocmd InsertEnter * call LazyLoadingYMC()

" 2 fzf(Fuzzy file finder)
" 2.1 Install fzf (zsh will install it automatically)
" 2.2 following setting
set rtp+=~/.fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
"   This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit',}
"   Default fzf layout
"   - down / up / left / right
let g:fzf_layout = {'down': '~40%'}
" quickly open files with fzf
nnoremap <silent> <leader>kk :Files<CR>
" open recent files with fzf
nnoremap <silent> <leader>rr :History<CR>

" 3 ag(Silver Searcher)
" 3.1 install ag (zsh will install it automatically)
" 3.2 ag settings
Plug 'mileszs/ack.vim', { 'on': ['Ag', 'Ack'] }
let g:ackprg = 'ag -vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" 4 Airline
Plug 'vim-airline/vim-airline'
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

" 5 Rust-specific plugin
" 5.1 Rust.vim
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1 " automatically formatted for standard style
" 5.2 Syntastic (Check syntax error)
Plug 'vim-syntastic/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

" 6 Theme plugin 
"   Not use vundle to install theme, but manually install it
"   These comment as a list to record themes I like.
" 6.1 Dracula-theme
" 6.2 OneDark
" 6.3 everforest
" 6.4 gruvbox-material

" 7 Commentary
Plug 'tpope/vim-commentary'
" comment out current line
nnoremap <leader>ci :Commentary<CR>
" comment out visually selected lines
vnoremap <leader>ci :Commentary<CR>

" All of your Plugins must be added before the following line
call plug#end()
" End - Setting up Vundle

" theme
set background=dark " for everforest or gruvbox-material theme
colorscheme gruvbox-material
