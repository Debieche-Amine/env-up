{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    appimage-run
    mesa-demos
  ];
}
