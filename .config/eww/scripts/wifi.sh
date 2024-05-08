#!/bin/sh

WIFI_NAME=$(nmcli -g "GENERAL.CONNECTION" d show wlp1s0f0)
if [ ! "$WIFI_NAME" ]; then
    echo '{"icon": "󰤭", "message": "Not Connected"}'
    exit
fi

IP_ADDRESS=$(nmcli -g "IP4.ADDRESS" d show wlp1s0f0 | cut -f1 -d"/")

echo "{\"icon\": \"󰤥\", \"message\": \"$WIFI_NAME - $IP_ADDRESS\"}"
