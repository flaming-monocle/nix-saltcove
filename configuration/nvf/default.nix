{ ... }:
{
  # Sources:
  # gh:jack-thesparrow/schrovimger
  # gh:C4E5G3/nvf

  imports = [
    ./core
    ./plugins
    # ./themes
    # ./ui
    # ./utility
  ];

  programs.nvf = {
    enable = true;
  };
}
