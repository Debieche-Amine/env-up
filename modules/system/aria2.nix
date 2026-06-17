{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  services.aria2 = {
    enable = true;
    openPorts = true; # Allows Web UIs to connect to it
    rpcSecretFile = "/home/${username}/.aria2-secret";

    settings = {
      dir = "/home/${username}/Downloads";
      max-connection-per-server = 16;
      min-split-size = "10M";
      split = 16;
    };
  };
}
