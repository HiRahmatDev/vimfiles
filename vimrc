" I comment this because I don't like the default configs from vim.
" source $VIMRUNTIME/defaults.vim    " Run defaults.vim

" ----- My configs -----
let g:netrw_banner=0
let g:netrw_browse_split=4  
let g:netrw_altv=1
let g:netrw_liststyle=3

set fillchars-=eob:~
set fillchars+=eob:\ 

set nocompatible
set backspace=indent,start
set display=truncate
set ruler
set number relativenumber
set hlsearch incsearch
set laststatus=2
set mouse=
set shell=pwsh
set shiftwidth=2 softtabstop=2 noexpandtab
set smartindent
set splitbelow splitright
set wildmenu

set nrformats-=octal    " avoid octal behavior when inc or dec number (CTRL-A or CTRL-X)
set scrolloff=2		" always keep a few lines around the cursor

" force EOL to LF
set fileformat=unix
set fileformats=unix

if &t_Co > 1	        " check if the terminal support color
  syntax enable
endif

" show (|) & (*) char for link or tag in vim
" example |bar| & *bar*, it's my preference, I like it
set conceallevel=0
hi link HelpBar Normal
hi link HelpStar Normal

" If you forget what is this, type this :h 05.2, 142gg (line 142)
if has('syntax') && has('eval')
  " built-in vim package 'matchinit' is make the command '%' more powerful
  packadd! matchit
endif

" ----- My Mappings ------
" set timeout	    " default is on
set timeoutlen=500   " in ms. Because of nottimeout, this applied to mappings & keycodes

" Normal mode mapping
nnoremap <Leader>" i"<Esc>ea"<Esc>
nnoremap <Leader>' i'<Esc>ea'<Esc>
nnoremap ff :20Le<CR>
nnoremap <Leader>r :so $MYVIMRC<CR>:echo 'vimrc successfully reloaded'<CR>

" Insert mode mapping
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>

