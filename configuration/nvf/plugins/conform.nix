{ ... }:
{
  programs.nvf.settings.vim = {
    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 500;
        };

        #default_format_opts.lsp_format = "fallback";

        formatters_by_ft = {
          nix = [ "nixfmt-rfc-style" ];
          rust = [ "rustfmt" ];
          python = [ "black" ];
          javascript = [
            "prettierd"
            # "prettier"
          ];
          yaml = [
            "perttierd"
            # "prettier"
          ];
          json = [
            "perttierd"
            # "prettier"
          ];
          jsonc = [
            "perttierd"
            # "prettier"
          ];
          markdown = [
            "perttierd"
            # "prettier"
          ];
          text = [ "trim_whitespace" ];
          dart_format = {
            args = [
              "format"
              "--line-length"
              "120"
              "$FILENAME"
            ];
          };
        };
      };
    };
  };
}
