#!/bin/sh

hyprctl hyprpaper preload $(realpath "$1")
hyprctl hyprpaper wallpaper eDP-1,$(realpath "$1")
