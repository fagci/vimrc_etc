syntax on
color darcula

let mapleader=','
let g:mapleader=','

if has('gui')
    if has('win32')
        set guifont=Courier_New:h9:cRUSSIAN::
    else
        set guifont=Terminus\ 10
    endif
endif

filetype plugin indent on

set history=1000 undolevels=1000
let fdir=expand("~/dotvim/vim_backups//")
if has('win32')
    let fdir=expand("~/vimfiles/vim_backups//")
endif
set backup
let &backupdir = fdir
let &directory = fdir
let &viewdir   = fdir

set hidden tildeop "~"
set wildignore=*.zip

set nocp ai digraph ek hid ru sc vb wmnu noeb noet nosol number lazyredraw foldenable
set ls=2 shm=at tw=120 t_Co=256 cmdheight=2 foldmethod=syntax foldcolumn=3
set backspace=indent,eol,start
set list listchars=tab:»\ ,trail:·
set smarttab shiftround et cin expandtab tabstop=4 shiftwidth=4 softtabstop=4 scrolloff=3
set autoread showmatch incsearch ignorecase smartcase cursorline showcmd

imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>

" reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>l mzgg=G`z
nmap <silent> <leader>x :!sh %<CR>

map <C-S-left> <C-w>h
map <C-S-right> <C-w>l
map <C-up> <C-w>k
map <C-down> <C-w>j

