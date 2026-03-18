{
  config,
  pkgs,
  ...
}: {
  # users.users.qylad.extraGroups = lib.mkAfter [ "docker" ];
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
}
