#!/bin/sh

WIFI=${INFO:-"Not Connected"}
ICON="󰤨"
IP=$(ipconfig getifaddr en0)

if [[ $INFO == "" ]]; then
    ICON="󰤭"
fi

if [[ $IP != "" ]]; then
    IP=" - ${IP}"
fi

sketchybar --set $NAME label="${WIFI}${IP}" icon="$ICON"
