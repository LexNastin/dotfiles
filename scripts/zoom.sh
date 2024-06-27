#!/bin/sh

ZOOM_FACTOR=0.15

change() {
    CURR_ZOOM=$(hyprctl -j getoption cursor:zoom_factor)
    NEW_ZOOM=$(jq ".float + $1" <<< "$CURR_ZOOM")
    hyprctl keyword cursor:zoom_factor $NEW_ZOOM
}

case "$1" in
    reset)
        hyprctl keyword cursor:zoom_factor 1.0
        ;;
    increase)
        change $ZOOM_FACTOR
        ;;
    decrease)
        change -$ZOOM_FACTOR
esac
