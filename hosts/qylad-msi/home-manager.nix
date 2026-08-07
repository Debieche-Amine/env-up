{
  inputs,
  username,
  pkgs-unstable,
  ...
}: {
  nixpkgs.overlays = [inputs.nix-openclaw.overlays.default];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs username pkgs-unstable;};
    backupFileExtension = "backup";

    users.${username} = {
      imports = [
        ../../modules/users/${username}
        inputs.nvf.homeManagerModules.default
        inputs.nix-openclaw.homeManagerModules.openclaw
      ];
    };
  };
}
