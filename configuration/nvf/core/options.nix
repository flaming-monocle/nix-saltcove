{ ... }:
{
  programs.nvf.settings.vim = {
    options = {
      # Numbering
      number = true;
      relativenumber = true;

      # Tab Settings
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      # Indentation
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      # Fold Settings
      foldenable = false;
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;

      #shada = "!,'100,<50,s10,h";
      #shadafile = "NONE";

      wrap = false;
    };
  };
}
