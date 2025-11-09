#!/bin/bash
# Move container to the previous workspace and follow

current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
prev=$((current - 1))
if [ $prev -ge 0 ]; then
    i3-msg move container to workspace number $prev
    i3-msg workspace number $prev
fi
