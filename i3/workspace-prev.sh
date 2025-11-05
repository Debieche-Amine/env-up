#!/bin/bash
# Switch to the previous workspace dynamically

current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
prev=$((current - 1))
if [ $prev -ge 0 ]; then
    i3-msg workspace number $prev
fi
