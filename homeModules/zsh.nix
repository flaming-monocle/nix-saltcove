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

      history.size = 10000;
      setOptions = [ "HIST_IGNORE_ALL_DUPS" ];

      shellAliases = {
        # Universal
        c = "clear";
        cs = "clear;ls";
        ct = "clear;tree";
        l = "ls";
        lsa = "ls -a";
        la = "ls -a";
        lsl = "ls -l";
        ll = "ls -l";
        lsla = "ls -la";
        lla = "ls -la";
        ".." = "cd ..";
        "..." = "cd ..; cd ..;";
        "...." = "cd ..; cd ..; cd ..;";
        gpush = ''git pull origin "$BRANCH_NAME"'';
        gpull = ''git pull origin "$BRANCH_NAME"'';
        glog = "git log --oneline --graph --all --decorate";
        gstatus = "git status";
        gdiff = "git diff";
      };

      initContent = ''
        ga() {
          git add .
          git status
        }
        gc() { git commit -m "$*" }

        g() { grep "$*" }
        gr() { grep -r "$*" }
        gl() { grep -l "$*" }
        glr() { grep -lr "$*" }
        grl() { grep -lr "$*" }

        nixls() {
          cd /etc/nixos
          tree -L 2 -P '*.nix'
        };
        nixrs() {
          wd=$(pwd)
          cd /etc/nixos
          git add .
          git status
          sudo nixos-rebuild switch --flake
          cd $wd
        }

        cdls() { cd "$*" && ls }
        cdl() { cd "$*" && ls }
        cdlsa() { cd "$*" && ls -a }
        cdla() { cd "$*" && ls -a }
        cdlsl() { cd "$*" && ls -l }
        cdll() { cd "$*" && ls -l }
        cdlsla() { cd "$*" && ls -la }
        cdlla() { cd "$*" && ls -la }
      '';
    }
    (mkIf (username == "kobi") {
      shellAliases = {
        cim = "vim";
        ivm = "vim";
        svim = "sudoedit";
        img = "qimgv";
        stash = "cd /home/kobi/Media && ./stash-linux";
        H = "cd && start-hyprland";
        sessionquit = "loginctl terminate-user kobi";
        pavu = "pavucontrol";
        r = "ranger";
      };

      # Summaries:
      # pk() creates a new zettel with args as title
      # pkr() opens a random zettel
      # pko() opens note edited longest ago
      # pkl() opens a note with no links

      # initContent = ''
      #   vaultDir="~/para"
      #   pk() {
      #     noteTitle="$(date +'%y%m%d')-$*.md"
      #     echo Making new note in ~/para/0inbox/$noteTitle
      #     echo Remember to sort inbox!
      #     cd $vaultDir
      #     cp $vaultDir/pk/template.md $vaultDir/0inbox/$noteTitle
      #     vim -c 'normal! o' -c 'normal! o' "$vaultDir/0inbox/$noteTitle"
      #   }
      #   pkr() { cd $vaultDir && nvim "$(ls | shuf -n 1)" }
      #   pko() { cd $vaultDir && nvim "$(ls -1tr | head -1)" }
      #   pkl() { cd $vaultDir && nvim "$(grep -Lr "\[\[" * | head --lines 1)" }
      #   pkls() { cd $vaultDir && tree -L 2 -P '*.md'"; }
      #   pkd() { cd $vaultDir && tree -L 2 -P '*.md'"; }
      # '';
    })
    (mkIf (username == "carlisle") {
      shellAliases = {
        K = "cd && startplasma-wayland";
        sessionquit = "loginctl terminate-user carlisle";
      };
      initContent = "";
    })
    (mkIf (username == "tui") {
      shellAliases = {
        svim = "sudoedit";
        H = "cd && start-hyprland";
        sessionquit = "loginctl terminate-user tui";
        # Deprecated in favor of `pk`
        # zet = "cd ~/Documents/secondbrain/'002 Zettelkasten' && vim $(date +'%y%m%d %H:%M')";
      };
      initContent = "";
    })
    (mkIf (hostName == "snowblack") { })
    (mkIf (hostName == "bifrost") { })
  ];
}
