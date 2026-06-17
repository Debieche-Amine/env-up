{...}: {
  imports = [
    ./android.nix
    # ./aria2.nix
    ./boot.nix
    ./docker.nix
    ./duckdns.nix
    ./firewall.nix
    ./fonts.nix
    ./litellm.nix
    ./locale.nix
    ./nh.nix
    ./nix.nix
    ./ollama.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sql.nix
    ./ssh.nix
    ./steam.nix
    ./waydroid.nix
    ./wifi.nix
    ./pkgs
    ./nix-ld
    ./DE/cosmic.nix
  ];
}
