{
  config,
  lib,
  pkgs,
  ...
}: {
  services.aria2 = {
    enable = true;
    openPorts = true; # Allows Web UIs to connect to it
    downloadDir = "/home/qylad/Downloads";

    # Explicitly configure the RPC settings
    rpc = {
      enable = true;
      secretFile = "/home/qylad/.aria2-secret";
    };

    settings = {
      max-connection-per-server = 16;
      min-split-size = "10M";
      split = 16;
    };
  };
}
