{ config, lib, pkgs, ... }:
let
  user = config.home.username;
in
{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
    };

    shellAliases = lib.mkMerge [
      {
        # Universal
        c = "clear";
        cs = "clear;ls";
        ct = "clear;tree";
        la = "ls -a";
        ll = "ls -l";
        lsa = "ls -laFh";
        root = "cd /";
        ".." = "cd ..";
        "..." = "cd ..; cd ..;";
        "...." = "cd ..; cd ..; cd ..;";
        ga = "git add .";
        ggpull = ''git pull origin "$(current_git_branch)"'';
        ggpush = ''git push origin "$(current_git_branch)"'';
        nixls = "cd /etc/nixos/ && tree";
        nixrs = "cd /etc/nixos && git add . && sudo nixos-rebuild switch --flake";
        pavu = "pavucontrol";
        r = "ranger";
      }
      # Kobi-specific binds
      (lib.mkIf (user == "kobi") {
        cim = "vim";
        ivm = "vim";
        svim = "sudoedit";
        img = "qimgv";
        stash = "cd /home/kobi/Media && ./stash-linux";
        H = "Hyprland";
        sessionquit = "hyprctl dispatch exit";
      })
      # Carlisle-specific binds
      (lib.mkIf (user == "carlisle") {
        K = "startplasma-wayland";
        sessionquit = "loginctl terminate-user carlisle";
      })
    ];

    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "alias-finder"
	      "common-aliases"
	      "colored-man-pages"
	      "fzf"
	      "kitty"
	      "vscode"
      ];
    };

    initContent = ''
			gc() { git commit -m "$*" }
			sgc() { sudo git commit -m "$*" }
                        gp() { grep "$*" }
                        gpr() { grep -r "$*" }
                        gpl() { grep -l "$*" }
                        gplr() {grep -lr "$*" }
                        gprl() {grep -lr "$*" }
		'';
  };
}
