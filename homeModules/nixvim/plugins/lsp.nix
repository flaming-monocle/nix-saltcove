vaultDirEsc: { config, pkgs, lib, ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      bashls.enable = true;
      markdown-oxide = {
        enable = true;
        filetypes = [ "markdown" ];
      };
      obsidian = {
        enable = true;
        workspaces = [
          {
            name = "secondbrain";
            path = vaultDirEsc;
          }
        ];
        completion = { # wikilink syntax consistency with Obsidian, according to Gemini
          nvim_cmp = false; # conflicts with blink-cmp
          min_chars = 2;
        };
        # map 'gd' to follow links in plugin logic:
        follow_url_func.__raw = ''
          function(url)
            vim.fn.jobstart({"xdg-open", url})
          end
        '';
      };
      pyright = {
        enable = true;
        filetypes = [ "python" ];
      };
      jsonls = {
        enable = true;
        filetypes = [ "json" ];
      };
      nil_ls = {
        enable = true;
        filetypes = [ "nix" ];
      };
    };
    keymaps = {
      silent = true;
      lspbuf = {
        "K" = "hover";
        "gd" = "definition";
        "gD" = "declaration";
        "gr" = "references";
        "gI" = "implementation";
        "gy" = "type_definition";
        "<leader>rn" = "rename";
      };
      diagnostic = {
        "[" = "goto_prev";
        "]" = "goto_next";
      };
    };
  };
}
