#!/bin/sh

WORKSPACE=$(hyprctl activeworkspace -j | jq ".id")

handle() {
    case "$1" in
        workspace*)
            WORKSPACE=$(echo "$1" | cut -f3 -d">")
            ;;
    esac
    ACTIVE_WORKSPACES=$(hyprctl workspaces -j | jq -c "map({(.id|tostring): (.windows != 0)}) | add")
    echo "{\"workspace\": \"$WORKSPACE\", \"active_workspaces\": $ACTIVE_WORKSPACES}"
}

handle "workspace>>$WORKSPACE"
socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
