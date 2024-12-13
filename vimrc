" Note: this configs is for vim windows
" I comment this because I don't like the default configs from vim.
" source $VIMRUNTIME/defaults.vim    " Run defaults.vim

" ------------------------------- My configs -----------------------------------
" TODO: need separate this mappings, func, etc. into modular file

set nocompatible

let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_altv = 1
let g:netrw_usetab = 1
let g:netrw_list_hide = '.git/'

if has('vim9script')
  let g:GIT_LENS_ENABLED = v:true
endif

let g:ale_floating_preview = 1
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_echo_msg_format = '%linter%(%code%): %s'
let g:ale_virtualtext_prefix = '%comment% %linter%(%code%): '
let g:ale_linters_explicit = 1

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_info = 'i'

let jsts_linters = ['tsserver', 'eslint']
let jsts_fixers = ['prettier', 'eslint']

let g:ale_linters = {
  \   'vim': ['vimls'],
  \   'json': ['eslint'],
  \   'jsonc': ['eslint'],
  \   'javascript': jsts_linters,
  \   'typescript': jsts_linters,
  \   'javascriptreact': jsts_linters,
  \   'typescriptreact': jsts_linters
  \ }

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines'],
  \   'javascript': jsts_fixers,
  \   'typescript': jsts_fixers,
  \   'javascriptreact': jsts_fixers,
  \   'typescriptreact': jsts_fixers,
  \   'css': ['prettier'],
  \   'json': ['prettier']
  \ }

let g:ale_completion_symbols = {
  \   'text': '',
  \   'method': '',
  \   'function': '',
  \   'constructor': '',
  \   'field': '',
  \   'variable': '',
  \   'class': '',
  \   'interface': '',
  \   'module': '',
  \   'property': '',
  \   'unit': 'unit',
  \   'value': 'val',
  \   'enum': '',
  \   'keyword': 'keyword',
  \   'snippet': '',
  \   'color': 'color',
  \   'file': '',
  \   'reference': 'ref',
  \   'folder': '',
  \   'enum member': '',
  \   'constant': '',
  \   'struct': '',
  \   'event': 'event',
  \   'operator': '',
  \   'type_parameter': 'type param',
  \   '<default>': 'v'
  \ }

let g:airline_theme = 'google_dark'
let g:airline#extensions#tabline#enabled = 1

syntax enable
filetype plugin indent on

" If you forget what is this, type this :h 05.2, 142gg (line 142)
if has('syntax') && has('eval')
  " built-in vim package 'matchinit' is make the command '%' more powerful
  " require 'filetype plugin on'
  packadd! matchit
endif

set termguicolors
set background=dark
colorscheme ayu

augroup vimrc
  autocmd!
  autocmd FileType vim setlocal textwidth=80
  autocmd TerminalOpen * setlocal nornu nonu
augroup END

set autoindent smartindent
set backspace=indent,start
set cursorline
set display=truncate
set fileformats=unix,dos
set fillchars-=eob:~
set fillchars+=eob:\ 
set formatoptions+=nj
set ignorecase smartcase
set incsearch hlsearch
set laststatus=2
set mouse=
set nrformats-=octal              " avoid octal behavior when inc or dec number
                                  "                       (CTRL-A or CTRL-X)
set nowrap sidescroll=5
set noshowmode
set noswapfile
set number relativenumber
set ruler
set scrolloff=8                   " always keep 8 lines around the cursor
set sessionoptions+=unix,slash    " force saving session file format to unix
set shiftwidth=2 tabstop=2 expandtab
set splitbelow splitright
set wildignore=*/node_modules/*,*/.next/*,*/build/*,*/.git/*
set wildmenu
set wildoptions=pum

" ------------------------------- My mappings ----------------------------------

" set timeout           " default is on
set timeoutlen=500      " in ms. Because of nottimeout, this applied to mappings
                        " & keycodes

let g:mapleader = ';'   " replace <Leader> from '\' to ';'

" Basic
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>c :close<CR>
nnoremap <Leader>h :noh<CR>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>
inoremap UU <Esc>viwUA
inoremap uu <Esc>viwuA

" Netrw
function! IsNetrwOpen()
  for w in range(1, winnr('$'))
    if getwinvar(w, '&filetype') ==# 'netrw'
      return w
    endif
  endfor

  return 0
endfunction

function! OpenNetrw()
  Lexplore | vert res 30 | exec 'normal I' | exec 'normal I'
endfunction

function! ToggleNetrw()
  let netrw_window = IsNetrwOpen()

  if netrw_window
    exec netrw_window . "wincmd w" |  silent! close
  else
    call OpenNetrw()
  endif
endfunction
nnoremap <Leader>f :call ToggleNetrw()<CR>

" Vimrc
nnoremap <Leader>sv :so $MYVIMRC<CR>:echo 'vimrc successfully reloaded'<CR>
nnoremap <Leader>ev :vs $MYVIMRC<CR>

" Git / graph
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gg :Flog -all<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gb :Git blame<CR>

" Buffer
nnoremap <Leader>b :b 
nnoremap <Leader>t :bnext<CR>
nnoremap <Leader>T :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bo :Bo<CR>

" ALE
nnoremap <Leader>F <Plug>(ale_fix)
nnoremap <Leader>d <Plug>(ale_detail)
nnoremap <C-J> <Plug>(ale_next)
nnoremap <C-K> <Plug>(ale_previous)
nnoremap <C-Space> <Plug>(ale_hover)
inoremap <C-Space> <Plug>(ale_complete)

augroup JSTSMappings
  autocmd!
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact
    \ nnoremap <C-]> <Plug>(ale_go_to_definition)
augroup END

