set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set smartcase               " works as case-insensitive if you only use lowercase letters
set hlsearch                " highlight search
set incsearch               " incremental search
set wrapscan
set tabstop=4               " number of columns occupied by a tab
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
"set colorcolumn=80          "set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set nowrap
set virtualedit=onemore
set mouse=a                 " enable mouse click
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

if has('nvim')
    call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    call plug#end()
endif
