{ config, lib, pkgs, ... }:
{
  imports = [
    #inputs.nixvim.homeModules.nixvim #TODO may be a problem, reassess after first config
    ./plugins/default.nix
    ./keymaps.nix
    ./colorscheme.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    luaLoader.enable = true;

    diagonstics = {
      virtual_text = false; # Handled by tiny-inline-diagnostic
    };

    extraPackages = with pkgs; [
      nil
      markdown-oxide
      ripgrep
      fd
      nixfmt
    ];

    performance.combinePlugins = {
      enable = true;
      standalonePlugins = [
        "blink.cmp"
        "oil.nvim"
      ];
    };

    globals = {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      # Performance
      updatetime = 100;

      # UI & Appearance
      termguicolors = true;
      
      #number = true;
      relativenumber = true;
      cursorline = true;
      scrolloff = 8;
      
      # Windows & Splits
      splitbelow = true;
      splitright = true;

      # Search
      ignorecase = true;
      
      # Files & Buffers
      undofile = true;
      fileencoding = "utf-8";
      encoding = "utf-8";

      # Indentation & Formatting
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      breakindent = true;
      preserveindent = true;
      wrap = true;

      # Completion & Popups
      pumheight = 5;
      infercase = true;

      # Command Line & Messages
      cmdheight = 0;
      history = 100;
    };
  };
}
