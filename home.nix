{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "malina";
  home.homeDirectory = "/home/malina";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./vim.nix
    ./emacs.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "fk" ''
    #   echo "-shell -p !! --run !!"
    # '')
  ] ++ (with pkgs; [
   # utility tools
    python3
    neofetch
    bat
    delta
  ]);
  programs.git = {
    enable = true;
    userName = "kryr34";
    userEmail = "uhamia@protonmail.com";
    aliases = {
      lag1 = "log --all --graph --oneline";
    };
  };

  programs.bash.enable = true;
  programs.bash.initExtra = ''
    NO_FORMAT="\033[0m"
    C_RED="\033[38;5;9m"
    PS1=" [nixos@X240]''${C_RED} PROMPT HERE >>> ''${NO_FORMAT}"
  '';
  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
    # prompt
    setopt prompt_subst
    function _fishy_collapsed_wd() {
        local i pwd
        pwd=("''${(s:/:)PWD/#''$HOME/~}")
        if (( ''$#pwd > 1 )); then
            for i in {1..''$((''$#pwd))}; do
                if [[ "''$pwd[''$i]" = .* ]]; then
                    pwd[''$i]="''${''${pwd[''$i]}[1,2]}"
                else
                    pwd[''$i]="''${''${pwd[''$i]}[1]}"
                fi
            done
        fi
        echo "''${(j:/:)pwd}"
    }
    local CUSTOM_MSG="%B%F{red}PROMPT HERE >>>%f%b"
    PS1=' ''${CUSTOM_MSG} ''$(_fishy_collapsed_wd) %F{green}''$%f '

    local return_status="%B%F{red}%(?..%?)%f%b"
    RPROMPT="''${return_status} %T"
    # end o prompt
  '';
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
  };

  programs.fzf = {
    enable = true;
    historyWidgetOptions = [
      "--layout=reverse"
    ];
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/malina/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
