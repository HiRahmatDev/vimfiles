set number

set mouse=
set backspace=indent
set shiftwidth=2

" show (|) & (*) char for link or tag in vim
" example |bar| & *bar*
hi link HelpBar Normal
hi link HelpStar Normal

if &t_Co > 1	" check if the terminal support color
   syntax enable
endif