syntax on
color darcula
let mapleader=','

if has('gui')
    if has('win32')
        set guifont=Lucida_Console:h10:cRUSSIAN::
    else
        set guifont=Terminus\ 10
    endif
endif

filetype plugin indent on

set history=1000
set backupdir=~/dotvim/vim_backups//
set directory=~/dotvim/vim_backups//
set viewdir=~/dotvim/vim_backups//

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

set tildeop "~"

autocmd BufWritePost .vimrc source %

set nocp ai digraph ek hid ru sc vb wmnu noeb noet nosol number lazyredraw foldenable
set ls=2 shm=at tw=120 t_Co=256 cmdheight=2 foldmethod=syntax foldcolumn=3
set backspace=indent,eol,start
set list listchars=tab:»\ ,trail:· " ,eol:¶
set et cin expandtab tabstop=4 shiftwidth=4 softtabstop=4 scrolloff=3
set hls showmatch incsearch ignorecase smartcase cursorline showcmd

" сохранение текущего буфера
imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>

inoremap <C-F> <ESC>
inoremap <C-c> <ESC>

imap <S-Tab> <ESC>:tabprevious<CR>
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

map <C-M-l> <ESC>:retab<CR>


