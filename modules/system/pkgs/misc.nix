{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    android-tools
    appimage-run
    quickemu
    spice-gtk
    mesa-demos
  ];
}
