{
  pkgs,
  pkgs-unstable,
  ...
}: {
  systemd.services.good-morning-chatgpt = {
    description = "Good morning chatgpt";
    serviceConfig = {
      Type = "oneshot";
      User = "qylad";
      ExecStart = "${pkgs-unstable.pi-coding-agent}/bin/pi --model gpt-5.4-mini:off --provider openai-codex -p hello";
    };
  };

  systemd.timers.good-morning-chatgpt = {
    description = "Trigger Good Morning every X minuts";
    wantedBy = ["timers.target"];

    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "45m";
      Unit = "good-morning-chatgpt.service";
    };
  };
}
