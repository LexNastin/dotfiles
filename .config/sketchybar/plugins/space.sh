#!/bin/sh

COLOR=0x20000000

if [[ $SELECTED == "true" ]]; then
    COLOR=0x80000000
fi

sketchybar --set $NAME background.color=$COLOR
