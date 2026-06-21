{
  description = "NIXOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf/v0.8";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = {
      qylad-msi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "qylad";
        };

        modules = [
          ./hosts/qylad-msi
        ];
      };

      test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "test";
        };

        modules = [
          ./hosts/test
        ];
      };

      vm-test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
          username = "test";
        };

        modules = [
          ./hosts/vm-test
          "${nixpkgs}/nixos/modules/virtualisation/qemu-vm.nix"
        ];
      };
    };
  };
}
