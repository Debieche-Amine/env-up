# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/system/nix-ld.nix
    ./modules/system/android.nix
    ./modules/system/wifi.nix
    ./modules/steam.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-a73fd3be-fa25-4ea5-9fd8-bf77bd0356b2".device = "/dev/disk/by-uuid/a73fd3be-fa25-4ea5-9fd8-bf77bd0356b2";
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  virtualisation.spiceUSBRedirection.enable = true;

  services.ddclient = {
    enable = true;
    protocol = "duckdns";
    username = "";

    passwordFile = "/home/qylad/shadow/duckdns";
    domains = [
      "qylad.duckdns.org"
      "qylad-home.duckdns.org"
      "qylad-server.duckdns.org"
      "debiecheamine.duckdns.org"
    ];
    use = "web";
    ssl = true;
    interval = "5min";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa # OpenGL support (for glxgears/glxinfo)
      intel-media-driver # VAAPI / video acceleration
      intel-vaapi-driver # Intel VAAPI bindings
    ];
  };
  services.xserver.videoDrivers = ["intel"];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # networking.networkmanager.ensureProfiles.profiles.home = {
  #   connection = {
  #     id = "home";
  #     type = "wifi";
  #     autoconnect = true;
  #   };
  #   wifi.ssid = "ZTE_5G_uSUN2F";
  #   wifi-security = {
  #     key-mgmt = "wpa-psk";
  #     psk = "TH6sYPFK";
  #   };
  #   ipv4.method = "manual";
  #   ipv4.addresses = "192.168.1.2/24";
  #   ipv4.gateway = "192.168.1.1";
  #   ipv4.dns = "8.8.8.8";
  #   ipv6.method = "ignore";
  # };

  services.logind.settings.Login = {
    IdleAction = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    LidSwitchIgnoreInhibited = "no";
    HandlePowerKey = "ignore";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "Africa/Algiers";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # xkbOptions = "caps:escape";

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account.
  users.users.qylad = {
    isNormalUser = true;
    description = "qylad";
    extraGroups = lib.mkAfter [
      "networkmanager"
      "wheel"
      "docker"
      "kvm"
    ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "qylad" = import ./home.nix;
    };
  };

  programs.fish = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.firefox.enable = true;

  services.system76-scheduler.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "qylad";
  };

  virtualisation.docker = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Idk
    xclip
    wl-clipboard
    # postgresql_16
    android-tools
    appimage-run
    burpsuite
    cacert
    ripgrep
    lsof

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

    # Non Free App
    vivaldi
    discord
    spotify
    musescore
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  # services.postgresql = {
  #   enable = true;
  #   package = pkgs.postgresql_16;
  #   ensureDatabases = ["mydatabase"];
  #   authentication = pkgs.lib.mkOverride 10 ''
  #     #type database  DBuser  auth-method
  #     local all       all     trust
  #   '';
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    listenAddresses = [
      {
        addr = "0.0.0.0";
        port = 22;
      }
    ];
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.ollama = {
    enable = true;
  };

  # networking.nftables.enable = false;
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [
      22
      5000
      8001
    ];
    allowedTCPPortRanges = [
      {
        from = 12000;
        to = 12100;
      }
    ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
