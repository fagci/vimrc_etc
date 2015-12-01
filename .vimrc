syntax on
color darcula

let mapleader=','
let g:mapleader=','

if has('gui')
    if has('win32')
        set guifont=Lucida_Console:h10:cRUSSIAN::
    else
        set guifont=Terminus\ 10
    endif
endif

filetype plugin indent on

set history=1000 undolevels=1000
set backupdir=~/dotvim/vim_backups//
set directory=~/dotvim/vim_backups//
set viewdir=~/dotvim/vim_backups//

set hidden tildeop "~"

set nocp ai digraph ek hid ru sc vb wmnu noeb noet nosol number lazyredraw foldenable
set ls=2 shm=at tw=120 t_Co=256 cmdheight=2 foldmethod=syntax foldcolumn=3
set backspace=indent,eol,start
set list listchars=tab:»\ ,trail:·
set smarttab shiftround et cin expandtab tabstop=4 shiftwidth=4 softtabstop=4 scrolloff=3
set showmatch incsearch ignorecase smartcase cursorline "showcmd

" сохранение текущего буфера
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

