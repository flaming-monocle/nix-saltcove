{
  description = "Salt Cove configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
  };

  outputs = { self, nixpkgs, home-manager }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = inputs // { inherit system; };
      shared-modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        snowblack = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs;
          system = system;
          modules = shared-modules ++ [ ./snowblack.nix ];
        };
        bifrost = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs;
          system = system;
          modules = shared-modules ++ [ ./bifrost.nix ];
        };
      };
    };
}
