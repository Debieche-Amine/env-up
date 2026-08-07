{pkgs, ...}: {
  home.packages = with pkgs; [
    rustup
    python3
    alejandra
    nil
    nixd
  ];
}
