{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./system.nix

    inputs.home-manager.nixosModules.default
    ./home-manager.nix
  ];
}
