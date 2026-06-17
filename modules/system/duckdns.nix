{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  services.ddclient = {
    enable = true;
    protocol = "duckdns";
    username = "";

    passwordFile = "/home/${username}/shadow/duckdns";
    domains = [
      "qylad.duckdns.org"
      "qylad-home.duckdns.org"
      # "qylad-server.duckdns.org"
      "debiecheamine.duckdns.org"
    ];
    usev4 = "web";
    ssl = true;
    interval = "5min";
  };
}
