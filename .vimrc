let mapleader=","

set nu

set shortmess=atI

syntax on

set autoread

" set cindent
set autoindent
" set smartindent

set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

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
