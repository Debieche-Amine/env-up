{
  config,
  lib,
  pkgs,
  ...
}: {
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  networking.networkmanager.ensureProfiles = {
    environmentFiles = ["/home/qylad/shadow/zte_usun2f/secret"];

    profiles.home = {
      connection = {
        id = "home";
        type = "wifi";
        autoconnect = true;
      };
      wifi.ssid = "ZTE_5G_uSUN2F";
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "$WIFI_PSK";
      };
      ipv4.method = "manual";
      ipv4.addresses = "192.168.1.2/24";
      ipv4.gateway = "192.168.1.1";
      ipv4.dns = "8.8.8.8";
      ipv6.method = "ignore";
    };
  };

  # Your logind settings remain exactly as you wrote them
  services.logind.settings.Login = {
    IdleAction = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    LidSwitchIgnoreInhibited = "no";
    HandlePowerKey = "ignore";
  };
}
