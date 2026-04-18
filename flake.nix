{
  description = "Salt Cove configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim = {
    #  url = "github:nix-community/nixvim/main";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, stylix, ... }@inputs:
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
        nvf.nixosModules.default
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
