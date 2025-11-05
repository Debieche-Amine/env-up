#!/bin/bash
# Move container to the next workspace and follow

current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
next=$((current + 1))
i3-msg move container to workspace number $next
i3-msg workspace number $next
