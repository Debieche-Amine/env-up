{
  config,
  lib,
  pkgs,
  ...
}: {
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    listenAddresses = [
      {
        addr = "0.0.0.0";
        port = 22;
      }
    ];
  };
}
