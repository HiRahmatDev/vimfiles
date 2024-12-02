" I comment this because I don't like the default configs from vim.
" source $VIMRUNTIME/defaults.vim    " Run defaults.vim

" ----- My configs -----
set nocompatible

syntax enable
filetype plugin indent on

" If you forget what is this, type this :h 05.2, 142gg (line 142)
if has('syntax') && has('eval')
  " built-in vim package 'matchinit' is make the command '%' more powerful
  " require 'filetype plugin on'
  packadd! matchit
endif

let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 0
  \     }
  \   }
  \ }

set termguicolors
set background=dark
colorscheme PaperColor

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_liststyle=3
let g:netrw_preview=1
let g:netrw_alto=0
let g:netrw_altv=1

set backspace=indent,start
set display=truncate
set fillchars-=eob:~
set fillchars+=eob:\ 
set nohlsearch incsearch
set laststatus=2
set mouse=
set nrformats-=octal		  " avoid octal behavior when inc or dec number (CTRL-A or CTRL-X)
set nowrap sidescroll=5
set noshowmode
set number relativenumber
set path+=**
set ruler
set scrolloff=2			  " always keep a 2 lines around the cursor
set sessionoptions+=unix,slash	  " force saving session file format to unix
set shell=pwsh
set shellslash
set shiftwidth=2 softtabstop=2 noexpandtab
set smartindent
set splitbelow splitright
set wildignore=*/node_modules/*,*/.next/*,*/.git/*
set wildmenu
set wildoptions=pum

" force EOL to LF
set fileformats=unix,dos

" ----- My Mappings ------
" set timeout	    " default is on
set timeoutlen=500   " in ms. Because of nottimeout, this applied to mappings & keycodes

" Normal mode mapping
nnoremap <Leader>" i"<Esc>ea"<Esc>
nnoremap <Leader>' i'<Esc>ea'<Esc>
nnoremap ff :20Lexplore<CR>
nnoremap <Leader>V :so $MYVIMRC<CR>:echo 'vimrc successfully reloaded'<CR>
nnoremap <Leader>v :e $MYVIMRC<CR>

" Insert mode mapping
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>
