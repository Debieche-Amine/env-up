{
  description = "NixOS configuration with nvf and home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;}; # Passes 'inputs' to all modules
      modules = [
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        nixos-hardware.nixosModules.msi-prestige-15-a10sc

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;}; # Passes 'inputs' to home.nix
            users.qylad = {
              imports = [
                ./home.nix
                inputs.nvf.homeManagerModules.default # <--- The Fix
              ];
            };
          };
        }
      ];
    };
  };
}
