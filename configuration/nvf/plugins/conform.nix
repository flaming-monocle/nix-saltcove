{ config, pkgs, lib, ... }:
{
  programs.nvf.settings.vim.formatter.conform-nvim = {
    enable = true;

    setupOpts = {
        default_format_opts.lsp_format = "fallback";
        formatters_by_ft = {
          nix = [
            "alejandra"
          ];
