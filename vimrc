" I comment this because I don't like the default configs from vim.
" source $VIMRUNTIME/defaults.vim    " Run defaults.vim

" ----- My configs -----
set backspace=start
set display=truncate
set ruler
set number relativenumber
set hlsearch incsearch
set mouse=
set shell=pwsh
set shiftwidth=2 softtabstop=2 noexpandtab
set smartindent
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
hi link HelpBar Normal
hi link HelpStar Normal

" If you forget what is this, type this :h 05.2, 142gg (line 142)
if has('syntax') && has('eval')
  " built-in vim package 'matchinit' is make the command '%' more powerful
  packadd! matchit
endif

" I want to able undo partially after delete word in mode insert (i_CTRL-U)
inoremap <C-W> <C-G>u<C-W>
