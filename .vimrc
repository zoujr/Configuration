:let autoPairs = 0

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

:if autoPairs
    inoremap ( ()<ESC>i
    inoremap [ []<ESC>i
    inoremap { {}<ESC>i

    function! RemoveNextDoubleChar(char)
        let l:line = getline(".")
        let l:next_char = l:line[col(".")] " 取得当前光标后一个字符

        if a:char == l:next_char
            execute "normal! l"
        else
            execute "normal! i" . a:char . ""
        end
    endfunction
    inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
    inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
    inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
:endif

nnoremap <leader>n :NERDTreeToggle<CR>

set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>
