{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox-devedition
    burpsuite
    obs-studio
    vlc
    motrix
    zed-editor
    rio
    wezterm
    vivaldi
    discord
    spotify
    musescore
  ];
}
