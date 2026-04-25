{ ... }:
{
  programs.nvf.settings.vim = {
    notes.obsidian = {
      enable = true;
      setupOpts = {
        completion.nvim-cmp = true;
      };
    };
  };
}
