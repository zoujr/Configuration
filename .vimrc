:let autoPairs = 1

set nu

set shortmess=atI

syntax on

set autoread

set cindent
set autoindent
" set smartindent

set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

set ts=4
set shiftwidth=4
set expandtab
"set noexpandtab
set mouse=a

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
