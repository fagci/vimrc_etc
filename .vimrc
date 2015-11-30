set nocp

set number
set ruler
let mapleader=','
set laststatus=2
syntax on

" Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set wrap
set linebreak

set hls
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

" More space at the bottom
set scrolloff=3

set cursorline

" TODO: Пофиксить, разобраться
set wildmenu
set wildmode=list:longest,list:full

set backspace=indent,eol,start

filetype plugin indent on

set backupdir=~/dotvim/vim_backups//
set directory=~/dotvim/vim_backups//
set viewdir=~/dotvim/vim_backups//

set showcmd

set hidden

set history=1000

inoremap <C-F> <ESC>
inoremap <C-c> <ESC>

set t_Co=256



