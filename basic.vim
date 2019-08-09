set termguicolors                   " use true color
set nowrap                          " don't wrap line    
set hidden                          " allow jump buffer without saving
set signcolumn=yes                  " always show signcolumns

set number                          " show line number
set relativenumber                  " show relative number
set cursorline                      " highlight current line
set cursorcolumn                    " highlight current column

set ignorecase                      " ignore case when searching

set expandtab                       " use spaces instead of tabs
set softtabstop=4                   " tab key indents by 4 spaces
set shiftwidth=4                    " >> indents by 4 spaces
set shiftround                      " >> indents to next multiple of shiftwidth

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Only activated window have the highlight line & column
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorcolumn
autocmd WinLeave * set nocursorcolumn

" restore cursor position when opening file(if opened)
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
    set shell=/bin/bash
endif

