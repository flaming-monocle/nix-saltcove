{ config, ... }:
let
  base16 = config.lib.stylix.colors.withHashtag;
  vaultDir = "~/Documents/secondBrain/";
in
{
  # Remember, extraPackages are declared on nixvim.nix
  config.programs = {
    nixvim.plugins = {
      # One liners
      lz-n.enable = true;
      fzf-nerdfont.enable = true;
      web-devicons.enable = true;
      persistence.enable = true;

      #cursorline = {
      #  enable = true;
      #  settings = {
      #    cursorline = {
      #      enable = true;
      #      timeout = 0;
      #    };
      #    cursorword = {
      #      enable = true;
      #      hl = { underline = true; };
      #      min_length = 3;
      #    };
      #  };
      #};

      # Testing ground / todo list
      # lualine?
      # barbecue?
      # treesitter?
      # render-markdown?
      # neoscroll?
    };
  };

  imports = [
    (import ./alpha.nix base16 vaultDir)
    ./blink-cmp.nix
    ./bufferline.nix
    ./grug-far.nix
    ./highlight-colors.nix
    (import ./lsp.nix vaultDir)
    ./lspkind.nix
    ./neo-tree.nix
    (import ./obsidian.nix vaultDir)
    ./oil.nix
    ./project.nix
    ./telescope.nix
    ./tiny-inline-diagnostic.nix
    #./treesitter.nix
  ];
}
