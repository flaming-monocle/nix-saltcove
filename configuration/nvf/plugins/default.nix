{ ... }:
let 
  base16 = config.lib.stylix.colors.withHashtag;
  vaultDir = "/home/kobi/Documents/secondBrain/";
in
{
  imports = [
    (import ./alpha.nix base16 vaultDir)
    ./conform.nix
    ./debugger.nix
    ./fzf.nix
    ./filetree.nix
    ./floaterm.nix
    ./git.nix
    ./hardtime.nix
    ./languages.nix
    (import ./lsp.nix vaultDir)
    ./lualine.nix
    ./luasnip.nix
    ./notify.nix
    ./notes.nix
    ./nvzone-typr.nix
    ./minimap.nix
    (import ./obsidian.nix vaultDir)
    ./projects.nix
    ./snacks
    ./telescope.nix
    ./terminal.nix
    ./treesitter.nix
    ./undoTree.nix
    ./yanky.nix
  ];
}
