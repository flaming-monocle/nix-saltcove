{
  description = "Salt Cove configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    nixvim.url = "github:nix-community/nixvim/main";
    stylix.url = "github:nix-community/stylix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, nixvim, ... }:
    let
      system = "x86_64-linux";
      specialArgs = inputs // { inherit system; };
      shared-modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            backupFileExtension = "backup";
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        snowblack = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs;
          system = system;
          modules = shared-modules ++ [ ./hosts/snowblack.nix ];
        };
        bifrost = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs;
          system = system;
          modules = shared-modules ++ [ ./hosts/bifrost.nix ];
        };
      };
    };
}
