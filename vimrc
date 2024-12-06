" Note: this configs is for vim windows
" I comment this because I don't like the default configs from vim.
" source $VIMRUNTIME/defaults.vim    " Run defaults.vim

" ------------------------------- My configs -----------------------------------
" TODO: need separate this mappings, func, etc. into modular file

set nocompatible

syntax enable
filetype plugin indent on

" If you forget what is this, type this :h 05.2, 142gg (line 142)
if has('syntax') && has('eval')
  " built-in vim package 'matchinit' is make the command '%' more powerful
  " require 'filetype plugin on'
  packadd! matchit
endif

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_altv = 1
let g:netrw_usetab = 1
let g:netrw_list_hide = '.git/'

let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1
let g:ale_set_balloons = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'typescript': ['eslint', 'tsserver'],
  \   'javascript': ['eslint', 'standard'],
  \   'typescriptreact': ['eslint', 'tsserver'],
  \   'javascriptreact': ['eslint', 'standard']
  \ }
let g:ale_fixers = {
  \   'typescript': ['eslint', 'prettier'],
  \   'javascript': ['eslint', 'prettier'],
  \   'typescriptreact': ['eslint', 'prettier'],
  \   'javascriptreact': ['eslint', 'prettier']
  \ }

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

set autoindent smartindent
set backspace=indent,start
set cursorline
set display=truncate
set fileformats=unix,dos
set fillchars-=eob:~
set fillchars+=eob:\ 
set formatoptions+=rnj
set incsearch nohlsearch
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
" These two options 'shell=pwsh' & 'shellslash' is not compatible with
" rbong/vim-flog
" set shell=pwsh
" set shellslash
set shiftwidth=2 softtabstop=2 expandtab
set splitbelow splitright
set textwidth=80
set wildignore=*/node_modules/*,*/.next/*,*/.git/*
set wildmenu
set wildoptions=pum

" ------------------------------- My mappings ----------------------------------

" set timeout           " default is on
set timeoutlen=500      " in ms. Because of nottimeout, this applied to mappings
                        " & keycodes

let g:mapleader = ';'   " replace <Leader> from '\' to ';'

function! IsNetrwOpen()
  for w in range(1, winnr('$'))
    if getwinvar(w, '&filetype') ==# 'netrw'
      return w
    endif
  endfor

  return 0
endfunction

function! ToggleNetrw()
  let netrw_window = IsNetrwOpen()

  if netrw_window
    exec netrw_window . "wincmd w" |  silent! close
  else
    Lexplore | vert res 30 | exec 'normal I' | exec 'normal I'
  endif
endfunction

" vimrc
nnoremap <Leader>sv :so $MYVIMRC<CR>:echo 'vimrc successfully reloaded'<CR>
nnoremap <Leader>ev :vs $MYVIMRC<CR>
" Basic
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>f :call ToggleNetrw()<CR>
" Git / graph
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gg :Flog<CR>
nnoremap <Leader>gp :Git push<CR>
" Buffer
nnoremap <Leader>t :bnext<CR>
nnoremap <Leader>T :bprevious<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>bo :Bo<CR>
" Movement
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-T> <C-W>t
nnoremap <C-B> <C-W>b

" Insert mode mapping
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>
inoremap UU <Esc>viwUA
inoremap uu <Esc>viwuA
