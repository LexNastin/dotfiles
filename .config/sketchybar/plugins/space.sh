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

if [[ $NAME == "space.6" ]] && [[ "$(yabai -m query --spaces --space 6 | jq ".windows[]" | xargs -L1 -I"{}" yabai -m query --windows --window "{}" | jq ".app")" == *Xcode* ]]; then
    sketchybar --set $NAME background.color=$COLOR drawing=$DRAWING label="Xcode"
else
    if [[ $NAME == "space.6" ]]; then
        sketchybar --set $NAME background.color=$COLOR drawing=$DRAWING label="$SID"
    else
        sketchybar --set $NAME background.color=$COLOR drawing=$DRAWING
    fi
fi
