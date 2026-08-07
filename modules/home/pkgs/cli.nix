{
  pkgs,
  pkgs-unstable,
  ...
}: let
  codex2 = pkgs.writeShellScriptBin "codex2" ''
    export CODEX_HOME=/home/qylad/tmp/codex-home-camellia
    mkdir -p "$CODEX_HOME"
    exec ${pkgs-unstable.codex}/bin/codex "$@"
  '';
  codex3 = pkgs.writeShellScriptBin "codex3" ''
    export HOME=/home/qylad/.homes/home3/
    exec ${pkgs-unstable.codex}/bin/codex "$@"
  '';

  pi2 = pkgs.writeShellScriptBin "pi2" ''
    export HOME=/home/qylad/.homes/home2/
    exec ${pkgs-unstable.pi-coding-agent}/bin/pi "$@"
  '';
  pi3 = pkgs.writeShellScriptBin "pi3" ''
    export HOME=/home/qylad/.homes/home3/
    exec ${pkgs-unstable.pi-coding-agent}/bin/pi "$@"
  '';

  agy2 = pkgs.writeShellScriptBin "agy2" ''
    export HOME=/home/qylad/.homes/home2/
    export XDG_CONFIG_HOME="$HOME/config"
    export XDG_DATA_HOME="$HOME/data"
    export XDG_CACHE_HOME="$HOME/cache"
    export XDG_RUNTIME_DIR=/tmp/agy2-runtime
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/tmp/nonexistent-dbus-socket"

    mkdir -p \
      "$HOME" \
      "$XDG_CONFIG_HOME" \
      "$XDG_DATA_HOME" \
      "$XDG_CACHE_HOME" \
      "$XDG_RUNTIME_DIR"

    chmod 700 "$XDG_RUNTIME_DIR"

    exec ${pkgs-unstable.antigravity-cli}/bin/agy "$@"
  '';

  agy3 = pkgs.writeShellScriptBin "agy3" ''
    export HOME=/home/qylad/.homes/home3/
    export XDG_CONFIG_HOME="$HOME/config"
    export XDG_DATA_HOME="$HOME/data"
    export XDG_CACHE_HOME="$HOME/cache"
    export XDG_RUNTIME_DIR=/tmp/agy3-runtime
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/tmp/nonexistent-dbus-socket"

    mkdir -p \
      "$HOME" \
      "$XDG_CONFIG_HOME" \
      "$XDG_DATA_HOME" \
      "$XDG_CACHE_HOME" \
      "$XDG_RUNTIME_DIR"

    chmod 700 "$XDG_RUNTIME_DIR"

    exec ${pkgs-unstable.antigravity-cli}/bin/agy "$@"
  '';
in {
  home.file.".homes/home1/.keep".text = "";
  home.file.".homes/home2/.keep".text = "";
  home.file.".homes/home3/.keep".text = "";
  home.file.".homes/home4/.keep".text = "";
  home.file.".homes/home5/.keep".text = "";

  home.packages = [
    pkgs.jq
    pkgs.dust
    pkgs.xclip
    pkgs.wl-clipboard
    pkgs.gemini-cli
    pkgs.ripgrep
    pkgs.fd
    pkgs.httpie
    pkgs.zellij
    pkgs.nmap
    pkgs.ncdu
    pkgs.age
    pkgs.localtunnel

    pkgs-unstable.codex
    codex2
    codex3
    pkgs-unstable.claude-code
    pkgs-unstable.opencode
    pkgs-unstable.pi-coding-agent
    pi2
    pi3
    pkgs-unstable.antigravity-cli
    agy2
    agy3
  ];
}
