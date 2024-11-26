" I comment this because I don't like default configs.
" unlet! skip_defaults_vim		    " Don't skip defaults.vim
" source $VIMRUNTIME/defaults.vim		    " Run defaults.vim

" My configs
set number relativenumber
set hlsearch incsearch
set mouse=
set backspace=indent
set shiftwidth=2 softtabstop=2 noexpandtab
set shell=pwsh		    " set shell to Powershell 7
set fileformats=unix	    " set force EOL to LF instead of CRLF
set scrolloff=2		    " always keep a few lines around the cursor
set smartindent		    " auto indent based on programming lang

" show (|) & (*) char for link or tag in vim
" example |bar| & *bar*
hi link HelpBar Normal
hi link HelpStar Normal

if &t_Co > 1		    " check if the terminal support color
  syntax enable
endif
