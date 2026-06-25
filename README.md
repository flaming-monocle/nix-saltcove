# Welcome to Saltcove

My goal here is a NixOS flake that's designed for multiple users on multiple
hosts. The flake builds multiple systems, and those systems import user-specific
configs

## Top-level structure

- flake.nix
  - uses `shared-modules` for home-manager configs
  - builds nixosConfigurations.hostname
    - each hostname imports hosts/hostname.nix

- hosts/hostname.nix
  - imports...
    - hosts/hostname-hardware.nix for core host settings
    - configuration/default.nix for universal core settings
    - users/username.nix for to enable users
  - enables some core settings like hostname, nixpkgs configs, and boot settings

- users/username.nix
  - enables user with user.users
  - enables user-specific shell
  - imports relevant modules

- modules (in configuration/ and homeModules/) can contain conditional logic
  based on username and hostname, usually with the format

```
let
  inherit (osConfig.networking) hostname;
  inherit (config.home) username;
in {
  settings = mkMerge [
    { foo = bar }
    (lib.mkIf (hostname == "hostname") { option1 = "a" })
    (lib.mkIf (username == "username") { option2 = "b" })
  ];
}
```

Consider a file "zsh-toggle.nix" whose full contents are

```
_: {
  programs.zsh.enable = true;
}
```

To pass this code to flake.nix, the file is first imported into
users/username.nix as a module. Then, hosts/hostname.nix imports
users/username.nix, and flake.nix imports hosts/hostname.nix.

## Resulting functionality

- Each host only includes the users whose users/username.nix file is imported in
  the relevant hosts/hostname.nix
- Users can be configured differently per host using the conditional logic
  described above
- Each user imports the modules relevant to that user, cutting down on wasted
  space
- Modules can have different configurations and settings on a per-user or
  per-host basis

## Current issues

- nvf (github:notAShelf/nvf) is imported as a NixOS module rather than a
  home-manager module
- third-party flake imports are not standardized or modularized
- A lot of things in configuration/ should be home-manager modules in
  homeModules/ instead
