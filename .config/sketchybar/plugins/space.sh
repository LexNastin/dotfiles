#!/bin/sh

COLOR=0x20000000
PARSING_ID=0
DRAWING="off"

if [[ $SELECTED == "true" ]]; then
    COLOR=0x80000000
fi

if [[ $(yabai -m query --spaces --space $SID | jq -re ".windows != [] or .\"has-focus\"") == "true" ]]; then
    DRAWING="on"
fi

sketchybar --set $NAME background.color=$COLOR drawing=$DRAWING
