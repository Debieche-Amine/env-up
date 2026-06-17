{
  pkgs,
  lib,
  username,
  ...
}: {
  # Define a user account.
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = lib.mkAfter [
      "networkmanager"
      "wheel"
      "docker"
      "kvm"
    ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
}
