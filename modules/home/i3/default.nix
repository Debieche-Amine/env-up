# i3.nix
{
  config,
  pkgs,
  ...
}: {
  # i3 itself + companion tools
  home.packages = with pkgs; [
    i3status
    i3lock
    rofi
    alacritty
    firefox
    feh
    xclip
  ];

  # Enable the X session so i3 can run
  xsession.enable = true;

  xsession.windowManager.i3 = {
    enable = true;

    # Package variant — i3-gaps is merged into i3 since 4.22,
    # but this still works and is harmless
    package = pkgs.i3-gaps;

    config = {
      modifier = "Mod4"; # Super key

      # Workspace names with icons (requires Nerd Font for icons)
      workspaceAutoBackAndForth = true;
      workspaces = [
        {name = "1: web";}
        {name = "2: code";}
        {name = "3: term";}
        {name = "4: files";}
        {name = "5: misc";}
      ];

      # Terminal
      terminal = "alacritty";

      # App launcher
      menu = "rofi -show drun";

      # Fonts (window titles, bar)
      fonts = {
        names = ["JetBrains Mono" "DejaVu Sans Mono"];
        size = 11.0;
      };

      # Keyboard layout
      input."*" = {
        xkb_layout = "us";
      };

      # Gaps
      gaps = {
        inner = 8;
        outer = 4;
        smartGaps = true;
        smartBorders = "on";
      };

      # Keybindings
      keybindings = let
        mod = config.xsession.windowManager.i3.config.modifier;
      in {
        # Core window management
        "${mod}+Return" = "exec ${config.xsession.windowManager.i3.config.terminal}";
        "${mod}+d" = "exec ${config.xsession.windowManager.i3.config.menu}";
        "${mod}+Shift+q" = "kill";

        # Window focus (vim-style)
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Arrow-key fallback
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # Splitting
        "${mod}+b" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";

        # Layout
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # Float / tiling
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        # Parent / scratchpad
        "${mod}+a" = "focus parent";
        "${mod}+Shift+minus" = "move scratchpad";
        "${mod}+minus" = "scratchpad show";

        # Workspaces
        "${mod}+1" = "workspace 1: web";
        "${mod}+2" = "workspace 2: code";
        "${mod}+3" = "workspace 3: term";
        "${mod}+4" = "workspace 4: files";
        "${mod}+5" = "workspace 5: misc";

        "${mod}+Shift+1" = "move container to workspace 1: web";
        "${mod}+Shift+2" = "move container to workspace 2: code";
        "${mod}+Shift+3" = "move container to workspace 3: term";
        "${mod}+Shift+4" = "move container to workspace 4: files";
        "${mod}+Shift+5" = "move container to workspace 5: misc";

        # Reload / restart i3
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";

        # Exit i3 (logs out)
        "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Exit i3?' -b 'Yes' 'i3-msg exit'";

        # Lock screen
        "${mod}+Ctrl+l" = "exec i3lock -c 000000";

        # Media keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute   @DEFAULT_SINK@ toggle";

        # Backlight
        "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set +5%";
        "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 5%-";

        # Screenshot
        "Print" = "exec --no-startup-id flameshot gui";
      };

      # Startup apps
      startup = [
        {
          command = "feh --bg-scale ~/.config/wallpaper.jpg";
          notification = false;
        }
        {
          command = "flameshot";
          notification = false;
        }
        {
          command = "nm-applet";
          notification = false;
        }
        {
          command = "blueman-applet";
          notification = false;
        }
      ];

      # Window-specific rules
      window = {
        commands = [
          {
            command = "floating enable";
            criteria = {class = "Pavucontrol";};
          }
          {
            command = "floating enable";
            criteria = {class = "Nm-connection-editor";};
          }
          {
            command = "floating enable";
            criteria = {class = "Blueman-manager";};
          }
          {
            command = "move to workspace 1: web";
            criteria = {class = "Firefox";};
          }
        ];
      };

      # Bar (i3status)
      bars = [
        {
          position = "bottom";
          statusCommand = "i3status";
          fonts = {
            names = ["JetBrains Mono" "DejaVu Sans Mono"];
            size = 10.0;
          };
        }
      ];
    };

    # Extra config appended verbatim to the end of the generated config
    extraConfig = ''
      # Smart gaps: no gaps when there's only one window
      smart_borders on

      # Disable title bars
      default_border pixel 2
      default_floating_border pixel 2

      # Hide edge borders
      hide_edge_borders both
    '';
  };

  # i3status configuration
  programs.i3status = {
    enable = true;
    general = {
      colors = true;
      interval = 5;
      color_good = "#2ECC40";
      color_degraded = "#FFDC00";
      color_bad = "#FF4136";
    };
    modules = {
      "ipv6".enable = false;
      "wireless _first_".enable = false;
      "ethernet _first_" = {
        enable = true;
        settings = {
          format_up = "E: %ip (%speed)";
          format_down = "E: down";
        };
      };
      "battery all" = {
        enable = true;
        settings = {format = "%status %percentage %remaining";};
      };
      "disk /" = {
        enable = true;
        settings = {format = "Disk: %avail";};
      };
      "load" = {
        enable = true;
        settings = {format = "%1min";};
      };
      "memory" = {
        enable = true;
        settings = {format = "%used / %available";};
      };
      "tztime" = {
        enable = true;
        settings = {format = "%Y-%m-%d %H:%M";};
      };
    };
  };
}
