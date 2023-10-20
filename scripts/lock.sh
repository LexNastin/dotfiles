#!/bin/sh

PRIMARY="2D032B"
PRIMARY_LIGHT="60065B"
PRIMARY_DARK="130112"

SECONDARY="CA054D"
SECONDARY_LIGHT="F91066"
SECONDARY_DARK="B30545"

ACCENT="7B80CC"
ACCENT_LIGHT="989CD7"
ACCENT_DARK="5D64C0"

$HOME/.local/bin/eww open lockscreen

swaylock \
    -F \
    -c 00000000 \
    --bs-hl-color $SECONDARY \
    --indicator-idle-visible \
    --indicator-radius 64 \
    --indicator-thickness 2 \
    --indicator-x-position 1440 \
    --indicator-y-position 600 \
    --inside-color 00000000 \
    --inside-clear-color 00000000 \
    --inside-caps-lock-color 00000000 \
    --inside-ver-color 00000000 \
    --inside-wrong-color 00000000 \
    --key-hl-color $SECONDARY \
    --separator-color 00000000 \
    --line-color 00000000 \
    --line-clear-color 00000000 \
    --line-caps-lock-color 00000000 \
    --line-ver-color 00000000 \
    --line-wrong-color 00000000 \
    --ring-color $ACCENT_LIGHT \
    --ring-clear-color $ACCENT \
    --ring-caps-lock-color $ACCENT_LIGHT \
    --ring-ver-color $ACCENT_DARK \
    --ring-wrong-color $SECONDARY \
    --text-color $ACCENT_LIGHT \
    --text-clear-color $ACCENT \
    --text-caps-lock-color $ACCENT_LIGHT \
    --text-ver-color $ACCENT_DARK \
    --text-wrong-color $SECONDARY \
    --font "FiraCode Nerd Font Mono" \
    --font-size 40 \

$HOME/.local/bin/eww close lockscreen
