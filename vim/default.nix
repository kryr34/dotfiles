{ pkgs, ... }:
{
  home.sessionVariables.EDITOR = "vim";

  home.packages = with pkgs; [
    ((vim_configurable.override { }).customize {
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          vim-airline
          vim-nix
          vim-lastplace
          vimPlugins.haskell-tools-nvim
        ];
        opt = [ ];
      };
      vimrcConfig.customRC = builtins.readFile ./vimrc;
    })
  ];
}
