{...}: {
  services.logind.settings.Login = {
    IdleAction = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore";
    LidSwitchIgnoreInhibited = "no";
    HandlePowerKey = "ignore";
  };

  services.vnstat.enable = true;
  services.udisks2.enable = true;
  services.davfs2.enable = true;
}
