" vim: foldenable

set nocompatible

" ### Vundle plugins ### {{{

let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? '$HOME/vimfiles' : '$HOME/.vim'
let &runtimepath .= ',' . expand(vimDir . '/bundle/vundle')

let vundle_readme=expand(vimDir . '/bundle/vundle/README.md')

let hasPlugins=1

if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  execute 'silent !git clone https://github.com/gmarik/vundle "' . expand(vimDir . '/bundle/vundle') . '"'
  let hasPlugins=0
endif

filetype off
call vundle#begin(expand(vimDir . '/bundle'))
Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'groenewege/vim-less', { 'for': 'less' }
Plugin 'szw/vim-ctrlspace'
Plugin 'junegunn/limelight.vim'
Plugin 'sickill/vim-pasta'
Plugin 'ervandew/supertab'
Plugin 'ap/vim-css-color', { 'for': 'css' }
Plugin 'mattn/emmet-vim', { 'for': 'html' }
Plugin 'gregsexton/MatchTag', { 'for': 'html' }
Plugin 'othree/html5.vim', { 'for': 'html' }
call vundle#end()
filetype plugin indent on

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:pasta_disabled_filetypes = ['coffee']

" ### }}} ###

" ### General Config ### {{{

set number                      "Line numbers are good
set relativenumber
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set undolevels=1000
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set guicursor=a:blinkon0        "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set tabpagemax=15               "Max tabs count
set laststatus=2                "Always how status line
set textwidth=120
set t_Co=256                    "Terminal colors
let base16colorspace=256        "Access colors present in 256 colorspace
set cmdheight=2                 "Commands output height
set tildeop "~"
set esckeys                     "Function keys in Insert mode
set shortmess=at                "Confirm msg
set listchars=tab:»\ ,eol:¬,trail:·,extends:❯,precedes:❮
set showbreak=↪
set hidden                  "Buffers in bg
set ttyfast
set lazyredraw
set mat=4 " how many tenths of a second to blink
set magic
set cursorline
set clipboard=unnamedplus

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set showmatch

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set noswapfile
set nobackup
set nowb

if has('gui')
  if has('win32')
    set guifont=Courier_New:h9:cRUSSIAN::
  else
    set guifont=Terminus\ 10
  endif
endif

source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

" ### }}} ###

" ### Indentation ### {{{

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set cindent      "C indentation trigger

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" }}}

" ### Folds ### {{{

set foldmethod=marker   "fold based on ...
set foldnestmax=10       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
"set foldlevel=1

" }}}

" ### Completion ### {{{

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.zip
set omnifunc=syntaxcomplete#Complete

" }}}

" ### Syntax ### {{{

syntax on
colorscheme darcula
let g:airline_theme='tomorrow'
highlight Normal ctermbg=235
let g:limelight_conceal_ctermfg = 'gray'

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" ### Default file specs ### {{{

set encoding=utf-8
set ffs=unix,dos,mac

" }}}

" ### Mappings ### {{{

let mapleader=','
let g:mapleader=','

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>l mzgg=G`z
nmap <silent> <leader>x :!sh %<CR>

imap <C-d> <Esc>YPa

map <C-S-left> <C-w>h
map <C-S-right> <C-w>l
map <C-up> <C-w>k
map <C-down> <C-w>j

imap <silent> <leader><Tab> <Esc>:NERDTreeToggle<CR>a
nmap <silent> <leader><Tab> :NERDTreeToggle<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

nmap <leader><return> :set list!<cr>
nmap <leader>f :Limelight!!<cr>

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR>
"<space>

" }}}

" ### Functions ### {{{

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" }}}

" ### Autocommands ### {{{
if has('autocmd') && !exists('autocommands_loaded')
  let autocommands_loaded = 1
  autocmd BufWrite * :call DeleteTrailingWS()
  autocmd BufNewFile,BufRead *.json set ai filetype=javascript

  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab indentkeys-=*<return>
  autocmd FileType *.md.js :call SyntasticReset<cr>
  autocmd FileType markdown,textile setlocal textwidth=0 wrapmargin=0 wrap spell

  " automatically resize panes on resize
  autocmd VimResized * exe 'normal! \<c-w>='
  "autocmd BufWritePost .vimrc source %
  "autocmd BufWritePost .vimrc.local source %
  " save all files on focus lost, ignoring warnings about untitled buffers
  autocmd FocusLost * silent! wa
  autocmd BufNewFile,BufRead *.svg set filetype=xml

  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'stylus', 'html']
endif

" }}}

" ### Install plugins if needed ### {{{

if hasPlugins==0
  echo 'Installing plugins...'
  echo ''
  execute 'BundleInstall'
endif

" }}}

