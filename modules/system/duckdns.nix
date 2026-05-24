{
  config,
  lib,
  pkgs,
  ...
}: {
  services.ddclient = {
    enable = true;
    protocol = "duckdns";
    username = "";

    passwordFile = "/home/qylad/shadow/duckdns";
    domains = [
      "qylad.duckdns.org"
      "qylad-home.duckdns.org"
      # "qylad-server.duckdns.org"
      "debiecheamine.duckdns.org"
    ];
    use = "web";
    ssl = true;
    interval = "5min";
  };
}
