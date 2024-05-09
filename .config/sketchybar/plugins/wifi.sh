#!/bin/sh

INFO="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"
if [[ $INFO == "You are not associated with an AirPort network." ]]; then
    INFO=""
fi

WIFI=${INFO:-"Not Connected"}
ICON="󰤨"
IP=$(ipconfig getifaddr en0)

if [[ $INFO == "" ]]; then
    ICON="󰤭"
fi

if [[ $IP != "" ]]; then
    IP=" - ${IP}"
fi

# wifi name is a very sensitive thing so i hid it :) (gl cracking,
# it's >9 chars long and on my M1 Pro machine takes ~750ms to hash a
# single password...)
htpasswd -vb ~/.config/sketchybar/wifiname.txt "wifiname" "$INFO"
if [[ $? == 0 ]]; then
    networksetup -switchtolocation Home
else
    networksetup -switchtolocation Automatic
fi

sketchybar --set $NAME label="${WIFI}${IP}" icon="$ICON"
