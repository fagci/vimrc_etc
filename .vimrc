" vim: foldenable
" Note: use "{Font name} Mono [...]" font instead "{Font name} Mono [...] Mono"!

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

" Core, preload
Plugin 'gmarik/vundle'                                  " plugin manager
Plugin 'tpope/vim-fugitive'                             " work with git repository
Plugin 'ryanoasis/vim-devicons'                         " icons for nerdtree, airline, ...

" Frequently using
Plugin 'scrooloose/nerdcommenter'                       " comment lines easily
Plugin 'scrooloose/nerdtree'                            " files tree
Plugin 'Xuyuanp/nerdtree-git-plugin'                    " show git status in NERDTree
Plugin 'bling/vim-airline'                              " cool statusbar
Plugin 'tpope/vim-surround'                             " surround something with something
Plugin 'terryma/vim-multiple-cursors'                   " makes additional cursor for same words
Plugin 'godlygeek/tabular'                              " align thisgs vertically

" Moderate use
Plugin 'ctrlpvim/ctrlp.vim'                             " fuzzy search in nested directories
Plugin 'tomtom/tlib_vim'                                " for snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'                   " for snipmate
Plugin 'garbas/vim-snipmate'                            " snippets

" Need em?
"Plugin 'sjl/gundo.vim'                                 " graphical undo (u)
"Plugin 'junegunn/limelight.vim'                        " code flashlight

" Does not works properly / tuning needed
Plugin 'sickill/vim-pasta'                              " paste with right indentation
Plugin 'ervandew/supertab'                              " tab completion insert mode
Plugin 'szw/vim-ctrlspace'                              " quick navigate between tabs/files/buffers, workspaces

" Try it later
" Plugin 'scrooloose/syntastic'                         " automatic syntax checking

" File specific
Plugin 'kchmck/vim-coffee-script', { 'for': 'coffee' }  " coffee supply
Plugin 'groenewege/vim-less',      { 'for': 'less'   }  " less supply
Plugin 'ap/vim-css-color',         { 'for': 'css'    }  " highlight colors in css code
Plugin 'mattn/emmet-vim',          { 'for': 'html'   }  " zencoding replacement
Plugin 'gregsexton/MatchTag',      { 'for': 'html'   }  " hl matching tags
Plugin 'othree/html5.vim',         { 'for': 'html'   }  " html5 + svg completion

call vundle#end()
filetype plugin indent on

" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_powerline_fonts = 1
let g:pasta_disabled_filetypes = ['coffee']

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" emmet settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" }}}

" ### General Config ### {{{

set number                     " Line numbers are good
set relativenumber
set backspace=indent,eol,start " Allow backspace in insert mode
set history=1000               " Store lots of :cmdline history
set undolevels=1000
set showcmd                    " Show incomplete cmds down the bottom
set showmode                   " Show current mode down the bottom
set guicursor=a:blinkon0       " Disable cursor blink
set visualbell                 " No sounds
set autoread                   " Reload files changed outside vim
set tabpagemax=15              " Max tabs count
set laststatus=2               " Always how status line
set textwidth=120
set t_Co=256                   " Terminal colors
let base16colorspace=256       " Access colors present in 256 colorspace
set cmdheight=2                " Commands output height
set esckeys                    " Function keys in Insert mode
set shortmess=at               " Confirm msg
set hidden                     " Buffers in bg
set ttyfast
set lazyredraw
set mat=4                      " how many tenths of a second to blink
set magic
set cursorline
set clipboard=unnamedplus

set incsearch                  " Find the next match as we type the search
set hlsearch                   " Highlight searches by default
set ignorecase                 " Ignore case when searching...
set smartcase                  " ...unless we type a capital
set showmatch

set scrolloff=3                " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set noswapfile
set nobackup
set nowb

set listchars=tab:»\ ,eol:¶,trail:·,extends:❯,precedes:❮,nbsp:×
set showbreak=↪
set tildeop "~"

if has('gui')
  if has('win32')
    set guifont=Courier_New:h9:cRUSSIAN::
  else
    "    set guifont=Terminus\ 10
  endif
endif

source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

" }}}

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

set foldmethod=marker " fold based on ...
set foldnestmax=10    " deepest fold is 3 levels
set nofoldenable      " dont fold by default

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
hi Normal ctermbg=235
hi Folded ctermbg=236
hi LineNr ctermbg=237 ctermfg=244

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

hi def TestHL ctermbg=red
match TestHL /\%80v./

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

" move line up-down
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

nmap <leader><return> :set list!<cr>
nmap <leader>f :Limelight!!<cr>
nnoremap <leader>u :GundoToggle<CR>

nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR>
imap {<CR> {<CR>}<Esc>O<Tab>

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

" ### Load local config ### {{{
let localSettingsFile = expand(vimDir . '/.vimrc.local')
if filereadable(localSettingsFile)
  exec ':source' . localSettingsFile
endif
" }}}

" ### TESTBED ### {{{

func! MenuMove(d)
  if a:d == 'up'
    echo 'HIGH'
  elseif a:d == 'down'
    echo 'LOW'
  endif
endfunc

func! FM()
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  setlocal nonumber norelativenumber noshowcmd nocursorline

  call setline(1, '> Item 1')
  call setline(2, '  Item 2')

  syn clear
  syn match MenuItem /  .*/
  syn match MenuItemSelected /> .*/
  hi def MenuItem ctermfg=black ctermbg=white
  hi def MenuItemSelected ctermfg=white ctermbg=black

  " bind movement keys

  map <silent> <buffer> j :call MenuMove("down")<CR>
  map <silent> <buffer> k :call MenuMove("up")<CR>

  " unbind unnecessary keys

  map <silent> <buffer> <Down> j
  map <silent> <buffer> <Up> k
  map <buffer> h <Nop>
  map <buffer> l <Nop>
  map <buffer> <Left> <Nop>
  map <buffer> <Right> <Nop>
  map <buffer> i <Nop>
  map <buffer> a <Nop>
  map <buffer> I <Nop>
  map <buffer> A <Nop>
  map <buffer> o <Nop>
  map <buffer> O <Nop>

  1
endfunc

" }}}


