{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
  ];

  users.users.qylad.extraGroups = [
    "kvm"
    "adbusers"
  ];
}
