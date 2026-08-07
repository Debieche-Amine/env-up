{
  config,
  lib,
  pkgs,
  ...
}: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = true;
    listenAddresses = [
      {
        addr = "0.0.0.0";
        port = 22;
      }
    ];
  };
}
