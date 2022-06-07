" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named " '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

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

" Enble searching as you type, rather than waiting till you press enter.
set incsearch
" highlight matches
set hlsearch

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

" Map kj to ESC (only in insert mode)
inoremap kj <Esc>

" Map leader to comma
let mapleader = ","
let localleader = ","

" Map Tab to 4 Space
filetype plugin indent on   " turn on filetype 'detection', 'plugin' and 'indent'
set tabstop=4               " show existing tab with 4 spaces width
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " spaces in newline start
set expandtab               " On pressing tab, insert 4 spaces
" Not extend tab to 4 spaces in Makefile
autocmd FileType make setlocal noexpandtab

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

" find (search for) selected text
vnoremap <leader>ss y/\V<C-r>=escape(@",'/\')<CR><CR>

set scrolloff=5 " lines to cursor

" open a vertical terminal in vim
nnoremap <leader>xz :vs +te<CR>

" Basic mappings
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
nnoremap <leader>wq :wq<CR>
" Open the vimrc file anytime
nnoremap <leader>ev :e $HOME/.config/nvim/init.vim<CR>
" Open the zshrc file anytime
nnoremap <leader>ez :e $HOME/.zshrc<CR>

" Specific platform setting
if env == 'DARWIN'
    " MacOS
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
call plug#begin('$HOME/.config/nvim/plugged')

" Keep Plugin commands between plug#begin/end
" ----------- Add Plugin Declaration Here ----------

" 1 coc
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc settings
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-diagnostic',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-gitignore',
            \ 'coc-python',
            \ 'coc-pyright',
            \ 'coc-java',
            \ 'coc-rls',
            \ 'coc-json',
            \ 'coc-vimlsp']
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Run the Code Lens action on te current line.
nmap <leader>cl  <Plug>(coc-codelens-action)
" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" coc-explorer
nmap <leader>xf :CocCommand explorer<CR>

" 2 fzf(Fuzzy file finder)
" 2.1 Install fzf (zsh will install it automatically)
" 2.2 following setting
Plug '~/.fzf'           " enable fzf which installed by git
Plug 'junegunn/fzf.vim' " add fzf.vim
" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit',}
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = {'down': '~40%'}
" quickly open files with fzf (whether in NERDTree or not)
nnoremap <silent> <expr> <Leader>kk (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
" open recent files with fzf
nnoremap <silent> <leader>rr :History<CR>
" using Rg with fzf
nnoremap <silent> <leader>xm :Rg<CR>

" 3 visual multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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
" 4.3 airline theme
Plug 'vim-airline/vim-airline-themes'

" 5 Rust-specific plugin
" 5.1 Rust.vim
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1 " automatically formatted for standard style

" 6 Theme plugin 
"   Not use vundle to install theme, but manually install it
"   These comment as a list to record themes I like.
" 6.1 Dracula-theme
" 6.2 OneDark
" 6.3 everforest
" 6.4 gruvbox-material
Plug 'sainnhe/gruvbox-material'
" 6.5 light quiet
Plug 'aonemd/quietlight.vim'
" 6.6 iceberg
Plug 'cocopon/iceberg.vim'

" 7 Commentary
Plug 'tpope/vim-commentary', { 'on': 'Commentary' }
" comment out current line
nnoremap <leader>ci :Commentary<CR>
" comment out visually selected lines
vnoremap <leader>ci :Commentary<CR>

" 8 expand region
Plug 'terryma/vim-expand-region'
" smart select
map <leader>xx <Plug>(expand_region_expand)
map <leader>zz <Plug>(expand_region_shrink)

" 9 matlab support 
" this plugin must use with tmux
Plug 'MortenStabenau/matlab-vim', { 'for': 'matlab'}

" 10 lazygit
Plug 'kdheepak/lazygit.nvim'
" setup mapping to call :LazyGit
nnoremap <silent> <leader>l :LazyGit<CR>

" 11 ranger
Plug 'kevinhwang91/rnvimr'
nnoremap <c-o> :RnvimrToggle<CR>
tnoremap <silent> <c-o> <C-\><C-n>:RnvimrToggle<CR>
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
" Disable a border for floating window
let g:rnvimr_draw_border = 0
" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" 12 undotree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
nnoremap <F5> :UndotreeToggle<CR>

" 13 vim-surround
Plug 'tpope/vim-surround'

" All of your Plugins must be added above the following line
call plug#end()
" End - Setting up Plug-Vim

" automatic switch between light and dark theme
function! SetBackground()
    let hour = strftime("%H")
    if 6 <= hour && hour < 18
        set background=light
        set t_Co=256
        colorscheme quietlight
        let g:airline_theme='papercolor'
    else
        set background=dark
        colorscheme gruvbox-material
    endif
endfunction
call SetBackground()
