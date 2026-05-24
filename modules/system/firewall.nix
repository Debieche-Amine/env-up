{
  config,
  lib,
  pkgs,
  ...
}: {
  # networking.nftables.enable = false;
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [
      22
      5000
      8001
    ];
    allowedTCPPortRanges = [
      {
        from = 12000;
        to = 12100;
      }
    ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };
}
