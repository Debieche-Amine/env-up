{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};

    users.qylad = {
      imports = [
        ../../modules/users/qylad
        inputs.nvf.homeManagerModules.default
      ];
    };
  };
}
