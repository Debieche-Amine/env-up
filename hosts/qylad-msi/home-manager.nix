{
  inputs,
  username,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs username;};

    users.${username} = {
      imports = [
        ../../modules/users/${username}
        inputs.nvf.homeManagerModules.default
      ];
    };
  };
}
