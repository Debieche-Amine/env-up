# This is a placeholder for test's hardware configuration.
# REPLACE THIS after installing NixOS by running:
# nixos-generate-config --show-config
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # These dummy values will allow 'nix flake check' to pass
  # but will cause the actual build/install to fail until replaced.
  fileSystems."/" = {
    device = "/dev/disk/by-label/REPLACE_ME_BEFORE_BUILDING";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/REPLACE_ME_TOO";
    fsType = "vfat";
  };

  boot.loader.grub.device = "/dev/REPLACE_ME_OR_I_WILL_FAIL";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
