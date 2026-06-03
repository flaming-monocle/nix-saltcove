{ pkgs, ... }:
{
  # Unified settings per-user across hosts

  users.users = {
    kobi = {
      isNormalUser = true;
      description = "Terminal-only";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      initialPassword = "1111";
      shell = pkgs.zsh;
    };
  };
  programs.zsh.enable = true;

  home-manager = {
    users.kobi =
      { ... }:
      {
        imports = [
          ./../home.nix
          ./../homeModules/math.nix
          # ./../homeModules/nixvim # Current iteration has recursion problems. Prefer nvf via configuration.nix
          ./../homeModules/obsidian.nix
          ./../homeModules/zsh.nix
        ];

        programs.git = {
          enable = true;
          settings = {
            user = {
              name = "flaming-monocle";
              email = "kobi.l.oreilly@gmail.com";
            };
            credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
            init.defaultBranch = "main";
          };
        };
      };
  };
}
