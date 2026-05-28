{pkgs, ...}: {
  home.packages = with pkgs; [
    hello
    jq
    dust
    xclip
    wl-clipboard
    gemini-cli
    ripgrep
    fd
    httpie
    zellij
    nushell
    codex
  ];
}
