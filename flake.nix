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
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ttSchemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      # self,
      nixpkgs,
      home-manager,
      nvf,
      stylix,
      # tinted-theming,
      ...
    }@inputs:
    let
      inherit (nixpkgs.lib) nixosSystem;
      system = "x86_64-linux";
      specialArgs = inputs // {
        inherit system;
      };
      shared-modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = { inherit stylix; };
            backupCommand = "mv /bin/trash";
          };
        }
        nvf.nixosModules.default
        # base16.nixosModule
      ];
    in
    {
      nixosConfigurations = {
        snowblack = nixosSystem {
          inherit specialArgs system;
          modules = shared-modules ++ [
            ./hosts/snowblack.nix
          ];
        };
        bifrost = nixosSystem {
          inherit specialArgs system;
          modules = shared-modules ++ [
            ./hosts/bifrost.nix
          ];
        };
      };
    };
}
