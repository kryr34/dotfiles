{ config, pkgs, ... }:
let
  historyFile = "~/.historyfile";
  historySize = 10000; # in memory
  historySave = 50000; # in file
in
{
  #  programs.bash.historyFile = historyFile;
  #  programs.bash.historySize = historySize;
  #  programs.bash.historyFileSize = historySave;
  #  programs.zsh.history.path = historyFile;
  #  programs.zsh.history.size = historySize;
  #  programs.zsh.history.save = historySave;
  programs.bash.initExtra = builtins.readFile ./init.bash;
  programs.zsh.initExtra = builtins.readFile ./init.zsh;
  home.shellAliases = {
    # shell-relatived
    "..." = "cd ../..";
    "...." = "cd ../../..";
    la = "ls --all";
    treei = "tree --gitignore";
    # Shortname
    py = "python";
    # Color
    ls = "ls -F --color=auto";
    ip = "ip --color=auto";
    grep = "grep --color=auto";
    diff = "diff --color=auto";
    tree = "tree -C";
    where = "which"; # this makes more sense >:(
  };
}
