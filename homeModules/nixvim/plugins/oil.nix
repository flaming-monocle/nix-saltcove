{ pkgs, ... }:
{
  config.programs.nixvim.plugins.oil = {
    enable = true;
    # Overrides nixpkgs to delete conflicting doc file "recipes.md"
    package = pkgs.vimPlugins.oil-nvim.overrideAttrs (oldAttrs: {
      postInstall = ''
        rm -f $out/doc/recipes.md
      '';
    });
    settings = {
      defaultFileExplorer = true; # Replaces the clunky netrw
      viewOptions.showHidden = true;
    };
  };
}
