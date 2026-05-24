{
  config,
  lib,
  pkgs,
  ...
}: {
  services.ollama = {
    enable = true;
    # port = 56364;

    # openFirewall = true;
    # host = "0.0.0.0";
    # package = pkgs.ollama-cuda;
  };
}
