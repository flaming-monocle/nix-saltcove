{ ... }:
let
  vaultDir = "/home/kobi/Documents/secondBrain/";
in
{
  imports = [
    ./alpha.nix
    ./conform.nix
    # ./debugger.nix
    ./filetree.nix
    ./floaterm.nix
    ./fzf.nix
    # ./git.nix
    # ./hardtime.nix
    ./languages.nix
    ./lsp.nix
    ./lualine.nix
    # ./luasnip.nix
    ./minimap.nix
    ./notes.nix
    ./notify.nix
    ./obsidian.nix
    ./projects.nix
    ./snacks
    ./telescope.nix
    # ./terminal.nix
    ./treesitter.nix
    ./undoTree.nix
    ./yanky.nix
  ];
}
