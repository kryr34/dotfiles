{ pkgs, ... }:
{
  home.sessionVariables.EDITOR = "vim";

  home.packages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          vim-airline
          vim-nix
          vim-lastplace
        ];
        opt = [];
      };
      vimrcConfig.customRC = ''
        set nocompatible " this is redundant, but I prefer explicit settings over implicit/default behavior

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

        set backspace=indent,eol,start
        syntax on
        set number relativenumber
        set list
        set listchars=tab:\|\ ,trail:·
        set listchars+=precedes:«,extends:»
        set listchars+=nbsp:␣
        set nowrap
        set tabstop=4
        set colorcolumn=81
      '';
    }
  )];
}
