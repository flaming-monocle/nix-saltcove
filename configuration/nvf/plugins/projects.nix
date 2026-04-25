{ ... }:
{
  programs.nvf.settings.vim = {
    projects.project-nvim = {
      enable = true;
      setupOpts = {
        detection_methods = [
          "lsp"
          "pattern"
        ];
        patterns = [
          ".git"
          "flake.nix"
        ];
        exclude_dirs = [
          "~/"
          "~/.config"
          "~/.nixpkgs"
        ];
        manual_mode = true;
        silent_chdir = true;
        scope_chdir = "win";
      };
    };
  };
}
