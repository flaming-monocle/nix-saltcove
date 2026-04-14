vaultDir: { config, pkgs, lib, ... }:
{
  config.programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "SecondBrain";
          path = "${vaultDir}"; # Adjust this to your vault path
        }
      ];
      completion = {
        nvim_cmp = false;
        min_chars = 2;
      };
      # Optional: Makes links look cleaner
      ui.enable = true;
      legacy_commands = false;
    };
  };
}
