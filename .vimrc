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

if has("autocmd")  
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  
endif  

inoremap jj <esc>
inoremap jk <esc>

nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>r :bro ol<CR>
