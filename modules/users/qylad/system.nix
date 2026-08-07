{
  pkgs,
  lib,
  username,
  ...
}: {
  home-manager.backupFileExtension = "backup";

  users.users.${username} = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$IbGfePWup5v3i4hi31BR90$vp/MLNHpGX7S7drbJPHMrxYEFm/OIBQcR0iKmjyC2y2";
    shell = pkgs.fish;

    description = username;
    extraGroups = lib.mkAfter [
      "networkmanager"
      "wheel"
      "users"
    ];
    packages = with pkgs; [];
    linger = true;
  };
}
