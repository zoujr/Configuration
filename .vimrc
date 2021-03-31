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

"Copy and paste between terminala
set clipboard=unnamed

nnoremap <leader>n :NERDTreeToggle<CR>

set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>

inoremap jj <esc>
inoremap jk <esc>
