{
  config,
  lib,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable GRUB
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
    timeoutStyle = "menu";

    # gfxmodeEfi = "1920x1080"; # Change this to your monitor's actual resolution
    # splashImage = null;

    # theme = "${pkgs.kdePackages.breeze-grub}/grub/themes/breeze";

    # A modern, flat, and very clean look (Dark version)
    # theme = "${pkgs.sleek-grub-theme}/grub/themes/sleek-dark";

    # The popular soothing pastel theme (Mocha flavor)
    # theme = "${pkgs.catppuccin-grub}/grub/themes/catppuccin-mocha-grub-theme";

    # The official high-quality NixOS dark theme
    # theme = "${pkgs.nixos-grub2-theme}/grub/themes/nixos";

    # A very sharp, logo-focused minimalist theme
    # theme = "${pkgs.distro-grub-themes}/grub/themes/nixos";

    # Vibrant and colorful with a distinct modern style
    # theme = "${pkgs.tela-grub-theme}/grub/themes/tela";

    # memtest86.enable = true;
    # ipxe = {
    #   demo = ''
    #     #!ipxe
    #     dhcp
    #     chain http://boot.ipxe.org/demo/boot.php
    #   '';
    # };
  };

  boot.tmp.useTmpfs = true;

  boot.initrd.luks.devices."luks-a73fd3be-fa25-4ea5-9fd8-bf77bd0356b2".device = "/dev/disk/by-uuid/a73fd3be-fa25-4ea5-9fd8-bf77bd0356b2";
}
