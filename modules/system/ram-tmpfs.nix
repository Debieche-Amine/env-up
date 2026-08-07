{
  pkgs,
  lib,
  username ? "qylad",
  ...
}: {
  fileSystems."/home/${username}/ram" = {
    device = "tmpfs";
    fsType = "tmpfs";
    options = [
      "size=50%"
      "mode=0700"
      "uid=1000"
      "gid=100"
    ];
  };
}
