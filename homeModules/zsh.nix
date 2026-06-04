{
  config,
  osConfig,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkMerge;
  inherit (osConfig.networking) hostName;
  inherit (config.home) username;
in
{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = mkMerge [
    {
      # Unconditional
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history.size = 10000;

      shellAliases = {
        # Universal
        c = "clear";
        cs = "clear;ls";
        ct = "clear;tree";
        lsa = "ls -a";
        lsl = "ls -l";
        lsla = "ls -la";
        ".." = "cd ..";
        "..." = "cd ..; cd ..;";
        "...." = "cd ..; cd ..; cd ..;";
      };

      setOptions = [ "HIST_IGNORE_ALL_DUPS" ];

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
        gadd() { git add . }
        gcommit() { git commit -m "$*" }
        gpush() { git pull origin "$BRANCH_NAME" }
        gpull() { git pull origin "$BRANCH_NAME" }
        glog() { git log --oneline --graph --all --decorate }
        gstatus() { git status }
        gdiff() { git diff }

        grep() { grep "$*" }
        grepr() { grep -r "$*" }
        grepl() { grep -l "$*" }
        greplr() { grep -lr "$*" }
        greprl() { grep -lr "$*" }

        nixls() { cd /etc/nixos && tree -L 2 -P "*.nix" }
        nixrs() { cd /etc/nixos && git add . && sudo nixos-rebuild switch --flake }
      '';
    }
    (mkIf (username == "kobi") {
      shellAliases = {
        cim = "vim";
        ivm = "vim";
        svim = "sudoedit";
        img = "qimgv";
        stash = "cd /home/kobi/Media && ./stash-linux";
        H = "Hyprland";
        sessionquit = "loginctl terminate-user kobi";
        zet = "cd ~/Documents/secondbrain/'002 Zettelkasten' && vim $(date +'%y%m%d %H:%M')";
        pavu = "pavucontrol";
        r = "ranger";
      };
      initContent = ''
        Hyprland
      '';
    })
    (mkIf (username == "carlisle") {
      shellAliases = {
        K = "startplasma-wayland";
        sessionquit = "loginctl terminate-user carlisle";
      };
      initContent = ''
        startplasma-wayland
      '';
    })
    (mkIf (username == "tui") {
      shellAliases = {
        svim = "sudoedit";
        H = "Hyprland";
        sessionquit = "loginctl terminate-user tui";
        zet = "cd ~/Documents/secondbrain/'002 Zettelkasten' && vim $(date +'%y%m%d %H:%M')";
      };
      initContent = ''
        Hyprland
      '';
    })
    (mkIf (hostName == "snowblack") { })
    (mkIf (hostName == "bifrost") { })
  ];
}
