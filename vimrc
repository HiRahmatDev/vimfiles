" I comment this because I don't like the default configs.
" source $VIMRUNTIME/defaults.vim		    " Run defaults.vim

" ----- My configs -----
set shiftwidth=2 softtabstop=2 noexpandtab
set number relativenumber
set hlsearch incsearch
set mouse=		    " mouse off, force using keyboard
set backspace=indent	    " only backspace current change
set shell=pwsh		    " shell or terminal with Powershell 7
set fileformats=unix	    " force EOL to LF instead of CRLF
set scrolloff=2		    " always keep a few lines around the cursor
set smartindent		    " auto indent based on programming lang

" show (|) & (*) char for link or tag in vim
" example |bar| & *bar*
hi link HelpBar Normal
hi link HelpStar Normal

if &t_Co > 1		    " check if the terminal support color
  syntax enable
endif

" If you forget what is this, type this :h 05.2, line 142
if has('syntax') && has('eval')
  " built-in vim package 'matchinit' is make the command '%' more powerful
  packadd! matchit
endif
