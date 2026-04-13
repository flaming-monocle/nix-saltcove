{
  description = "Salt Cove configuration"

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }@inputs:
    {
      nixosConfigurations = {
        host1 = nixpkgs.lib.nixosSsystem {
          system = "x86_64-linux";
          modules = [ ./snowblack.nix];
        };
      };
    };
  };
}
