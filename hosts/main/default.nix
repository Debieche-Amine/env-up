{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./system.nix

    inputs.home-manager.nixosModules.default
    inputs.nixos-hardware.nixosModules.msi-prestige-15-a10sc
    ./home-manager.nix
  ];
}
