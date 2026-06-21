{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/system/locale.nix
  ];

  networking.hostName = "nixos-vm";
  networking.firewall.enable = false;
  time.timeZone = "Africa/Algiers";
  i18n.defaultLocale = "en_US.UTF-8";

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  users.users.test = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "test";
    shell = pkgs.fish;
  };
  environment.pathsToLink = ["/libexec"]; # links /libexec from derivations to /run/current-system/sw
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3blocks #if you are planning on using i3blocks over i3status
      ];
    };
  };

  services.displayManager.defaultSession = "none+i3";

  programs.i3lock.enable = true; #default i3 screen locker

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    htop
    i3
    vivaldi
  ];
  programs.fish.enable = true;

  services.qemuGuest.enable = true;
  boot.loader.grub.enable = false;

  # VM resources — these options DO exist in qemu-vm.nix

  system.stateVersion = "24.05";
}
