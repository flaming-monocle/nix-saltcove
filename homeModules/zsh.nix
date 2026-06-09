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

        gpush = ''git pull origin "$BRANCH_NAME"'';
        gpull = ''git pull origin "$BRANCH_NAME"'';
        glog = "git log --oneline --graph --all --decorate";
        gstatus = "git status";
        gdiff = "git diff";

        nixls = "cd /etc/nixos && tree -L 2 -P '*.nix'";
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
        gadd() {
          git add "$*"
          git status 
        }
        gcommit() {git commit -m "$*"}

        gp() {grep "$*"}
        gpr() {grep -r "$*"}
        gpl() {grep -l "$*"}
        gplr() {grep -lr "$*"}
        gprl() {grep -lr "$*"}

        nixrs() {
          wd=$(pwd)
          cd /etc/nixos 
          git add .
          git status
          sudo nixos-rebuild switch --flake
          cd $wd
        }
      '';
    }
    (mkIf (username == "kobi") {
      shellAliases = {
        cim = "vim";
        ivm = "vim";
        svim = "sudoedit";
        img = "qimgv";
        stash = "cd /home/kobi/Media && ./stash-linux";
        H = "start-hyprland";
        sessionquit = "loginctl terminate-user kobi";
        pavu = "pavucontrol";
        r = "ranger";
      };
      initContent = ''
        zet() {
          dateTime="$(date +'%y%m%d-%H%M')"
          title="$1"
          cd ~/Documents/secondbrain/'002 Zettelkasten'
          cp "zettelkasten-template.md" "$dateTime-$title.md"
          vim +10 "$dateTime-$title.md"
        }
      '';
    })
    (mkIf (username == "carlisle") {
      shellAliases = {
        K = "startplasma-wayland";
        sessionquit = "loginctl terminate-user carlisle";
      };
      initContent = "";
    })
    (mkIf (username == "tui") {
      shellAliases = {
        svim = "sudoedit";
        H = "start-hyprland";
        sessionquit = "loginctl terminate-user tui";
        zet = "cd ~/Documents/secondbrain/'002 Zettelkasten' && vim $(date +'%y%m%d %H:%M')";
      };
      initContent = "";
    })
    (mkIf (hostName == "snowblack") { })
    (mkIf (hostName == "bifrost") { })
  ];
}
