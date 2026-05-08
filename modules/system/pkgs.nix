{
  config,
  lib,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Idk
    libreoffice
    xclip
    wl-clipboard
    gemini-cli
    # postgresql_16
    android-tools
    appimage-run
    firefox-devedition
    burpsuite
    cacert
    ripgrep
    lsof
    pciutils

    nethogs

    obs-studio

    zip
    unzip
    rar

    sshfs

    quickemu
    spice-gtk

    tree

    mesa-demos
    vlc

    openssl

    pkg-config
    mysql80

    # Compiler, Interpreter, Formater, Language Server, ...
    rustup
    python3
    gcc
    alejandra
    nil
    nixd
    gnumake

    wget
    httpie

    # Tools
    git
    zellij

    # Download Manager
    motrix

    # Monitoring System, Performance
    btop
    intel-gpu-tools

    # Editor
    zed-editor

    # Terminal
    kitty
    alacritty
    rio
    wezterm

    # Shells
    nushell

    # Non Free App
    vivaldi
    discord
    spotify
    musescore
  ];
}
