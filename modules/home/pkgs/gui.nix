{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = [
    pkgs.mission-center
    pkgs.burpsuite
    pkgs.obs-studio
    pkgs.vlc
    pkgs.motrix
    pkgs.zed-editor
    pkgs.rio
    pkgs.wezterm
    pkgs.vivaldi
    pkgs.discord
    pkgs.spotify
    pkgs.musescore
    pkgs.gnome-weather
    pkgs.libreoffice

    pkgs.kdePackages.kate
    pkgs.kdePackages.dolphin

    pkgs.bolt-launcher
    pkgs.proton-vpn
    pkgs.chromium
  ];
}
