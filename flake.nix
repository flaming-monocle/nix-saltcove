{
  description = "Salt Cove configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs: {
    nixosConfigurations = {
      snowblack = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./snowblack.nix ];
      };
      bifrost = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./bifrost.nix ];
      };
    };
  };
}
