set autoindent              " indent a new line the same amount as the line just typed
set cursorline              " highlight current cursorline
set encoding=utf-8
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set smartcase               " works as case-insensitive if you only use lowercase letters
set hlsearch                " highlight search
set incsearch               " incremental search
set wrapscan
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4
set shiftwidth=4            " width for autoindents
set number                  " add line numbers
set relativenumber
set wildmode=longest,list   " get bash-like tab completions
"set colorcolumn=71                      "set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set nowrap
set virtualedit=onemore
set mouse=a                 " enable mouse click
"set ttyfast                 " Speed up scrolling in Vim
set list lcs=tab:\│\ 

nmap <C-i> :tabnext<CR>
nmap <C-o> :tabedit .<CR>
nmap <C-n> :tabnew<CR>

nmap <A-l> :resize +5<CR>
nmap <A-h> :resize -5<CR>
