#!/bin/sh

INFO="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
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
    if [[ -n "$(netstat -rn | grep 'default' | grep en0)" ]]; then
        if [[ "$(netstat -rn | grep 'default' | grep en0 | awk '{print $2}')" == "192.168.68.1" ]]; then
            networksetup -switchtolocation Home
        else
            networksetup -switchtolocation Automatic
        fi
    fi
else
    networksetup -switchtolocation Automatic
fi

sketchybar --set $NAME label="${WIFI}${IP}" icon="$ICON"
