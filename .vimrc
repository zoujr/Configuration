let mapleader=","

set nu
set run
set shortmess-=S

set shortmess=atI

syntax on

set autoread

" set cindent
set autoindent
" set smartindent

set hlsearch
set incsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Black
hi comment ctermfg=6

set tabstop=4
set shiftwidth=4
set softtabstop=4
" set softtabstop=0
set expandtab
" set noexpandtab
set mouse=a

set ignorecase

au BufWinLeave ?* silent mkview
au BufWinEnter ?* silent loadview

"Copy and paste between terminala
set clipboard=unnamed

inoremap jj <esc>
inoremap jk <esc>
