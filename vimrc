" I comment this because I don't like the default configs from vim.
" source $VIMRUNTIME/defaults.vim    " Run defaults.vim

" ------------------------------- My configs -----------------------------------

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

set autoindent smartindent
set backspace=indent,start
set display=truncate
set fileformats=unix,dos
set fillchars-=eob:~
set fillchars+=eob:\ 
set formatoptions+=rojn
set incsearch hlsearch
set laststatus=2
set mouse=
set nrformats-=octal              " avoid octal behavior when inc or dec number
                                  " (CTRL-A or CTRL-X)
set nowrap sidescroll=5
set noshowmode
set noswapfile
set number relativenumber
set path+=**
set ruler
set scrolloff=2                   " always keep a 2 lines around the cursor
set sessionoptions+=unix,slash    " force saving session file format to unix
set shell=pwsh
set shellslash
set shiftwidth=2 softtabstop=2 expandtab
set splitbelow splitright
set textwidth=80
set wildignore=*/node_modules/*,*/.next/*,*/.git/*
set wildmenu
set wildoptions=pum

" ------------------------------- My mappings ----------------------------------
" TODO: need separate this mappings into modular file

" set timeout           " default is on
set timeoutlen=500      " in ms. Because of nottimeout, this applied to mappings
                        " & keycodes

let g:mapleader = ';'   " replace <Leader> from '\' to ';'

" Normal mode mapping
nnoremap <Leader>" i"<Esc>ea"<Esc>
nnoremap <Leader>' i'<Esc>ea'<Esc>
nnoremap ff :20Lexplore<CR>
nnoremap <Leader>V :so $MYVIMRC<CR>:echo 'vimrc successfully reloaded'<CR>
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>t :bnext<CR>
nnoremap <Leader>T :bprevious<CR>

" Insert mode mapping
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>
