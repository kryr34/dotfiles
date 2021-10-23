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
set ttyfast                 " Speed up scrolling in Vim
set list lcs=tab:\│\ 
"colorscheme molokai

nmap <C-i> :tabnext<CR>
nmap <C-o> :tabedit 
nmap <C-n> :tabnew<CR>

if has('nvim')
    call plug#begin('~/.vim/plugged')
    Plug 'lervag/vimtex'
        let g:tex_flavar='latex'
        let g:vimtex_view_method='mupdf'
        let g:vimtex_quickfix_mod=1
        let g:vimtex_syntax_enabled=0
        set conceallevel=0
        let g:tex_conceal='abdmg'
        let g:vimtex_compiler_latexmk = {
        \'build_dir' : '',
        \    'callback' : 1,
        \    'continuous' : 1,
        \    'executable' : 'latexmk',
        \    'hooks' : [],
        \    'options' : [
        \        '-verbose',
        \        '-file-line-error',
        \        '-synctex=1',
        \        '-interaction=nonstopmode',
        \    ],
        \}
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
        let g:UltiSnipsExpandTrigger = '<tab>'
        let g:UltiSnipsJumpForwardTrigger = '<tab>'
        let g:UltiSnipsBackwardTrigger = '<s-tab>'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
        nnoremap <C-t> :NERDTreeToggle<CR>
        " Exit Vim if NERDTree is the only window remaining in the only tab.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    Plug 'preservim/tagbar'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'Yggdroot/indentLine'
    Plug 'etdev/vim-hexcolor'
    let g:indentLine_char_list = ['┆'] "['|', '¦', '┆', '┊']
    call plug#end()
endif
