{pkgs, ...}: let
  batteryNotify = pkgs.writeShellScriptBin "battery-notify" ''
    set -eu

    notified_levels=""
    levels=(50 35 25 20 15 10 7 5 4 3 2 1)

    while true; do
      battery=""
      for path in /sys/class/power_supply/BAT*; do
        [ -r "$path/capacity" ] && [ -r "$path/status" ] || continue
        battery="$path"
        break
      done

      if [ -z "$battery" ]; then
        ${pkgs.coreutils}/bin/sleep 300
        continue
      fi

      capacity="$(< "$battery/capacity")"
      status="$(< "$battery/status")"

      if [ "$status" = Discharging ]; then
        for level in "''${levels[@]}"; do
          if [ "$capacity" -le "$level" ] && [[ " $notified_levels " != *" $level "* ]]; then
            ${pkgs.libnotify}/bin/notify-send -u critical "Low Battery" "Battery is at $capacity% (below $level%)."
            notified_levels="$notified_levels $level"
          fi
        done
      else
        notified_levels=""
      fi

      ${pkgs.coreutils}/bin/sleep 60
    done
  '';
in {
  home.packages = with pkgs; [
    cliphist
    wl-clipboard
    batteryNotify
  ];

  systemd.user.services = {
    cliphist = {
      Unit = {
        Description = "Wayland clipboard history";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "on-failure";
      };
      Install.WantedBy = ["graphical-session.target"];
    };

    battery-notify = {
      Unit = {
        Description = "Desktop battery threshold notifications";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
        ConditionEnvironment = "WAYLAND_DISPLAY";
      };
      Service = {
        ExecStart = "${batteryNotify}/bin/battery-notify";
        Restart = "on-failure";
        RestartSec = 10;
      };
      Install.WantedBy = ["graphical-session.target"];
    };
  };
}
