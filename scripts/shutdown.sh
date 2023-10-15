#!/bin/sh

# thanks: https://www.reddit.com/r/hyprland/comments/12dhbuk/how_to_exitlogout_of_hyprland/jmjadmw/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button

# close all windows
HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
hyprctl --batch "$HYPRCMDS"

# schedule shutdown
sudo shutdown now
