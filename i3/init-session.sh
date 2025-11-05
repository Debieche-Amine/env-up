#!/bin/bash

# Define your terminal emulator command
TERMINAL="alacritty"

# Workspace 128
# i3-msg "workspace number 128"
# sleep 0.2
# $TERMINAL &
# sleep 0.2
# $TERMINAL &
# 
# Workspace 126
i3-msg "workspace number 126"
sleep 0.2
$TERMINAL &
sleep 0.2
$TERMINAL &
# 
# # Workspace 125
# i3-msg "workspace number 125"
# sleep 0.2
# $TERMINAL -e btop &
# 
# Workspace 127
# i3-msg "workspace number 127"
# sleep 0.2
# firefox &
