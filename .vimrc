set et
set sw=4
set ts=4
set nu
syntax on
set hlsearch
set ruler
nmap <SPACE> <SPACE>:noh<CR>
set autoindent
set backspace=indent,eol,start
nmap H ^
nmap L $

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<CR>
