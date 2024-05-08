#!/bin/bash

missing=()

# general commands
[ ! $(command -v nvim) ] && missing+=("neovim")
[ ! $(command -v zsh) ] && missing+=("zsh")
[ ! $(command -v jq) ] && missing+=("jq")
[ ! $(command -v kitty) ] && missing+=("kitty")
[ ! $(command -v rich) ] && missing+=("rich-cli")
[ ! $(command -v neofetch ) ] && missing+=("neofetch")
[ ! $(command -v sudo) ] && missing+=("sudo")

# fonts
[ $(command -v fc-list) ] && [ -z "$(fc-list | grep "FiraCode Nerd Font Mono")" ] && missing+=("FiraCode Nerd Font Mono")

# linux commands
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v firefox) ] && missing+=("firefox")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v nmcli) ] && missing+=("NetworkManager")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v wofi) ] && missing+=("wofi")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v brightnessctl) ] && missing+=("brightnessctl")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v slurp) ] && missing+=("slurp")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v grim) ] && missing+=("grim")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v wl-copy) ] && missing+=("wl-clipboard")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v dunstify) ] && missing+=("dunstify")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v xremap) ] && missing+=("xremap")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v xss-lock) ] && missing+=("xss-lock")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v pkexec) ] && missing+=("polkit")
[[ "$OSTYPE" != "darwin"* ]] && [ ! -s /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ] && [ ! -s /usr/libexec/polkit-gnome-authentication-agent-1 ] && missing+=("polkit-gnome")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v eww) ] && missing+=("eww")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v Hyprland) ] && missing+=("hyprland")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v hyprpaper) ] && missing+=("hyprpaper")
[[ "$OSTYPE" != "darwin"* ]] && [ ! $(command -v swaylock) ] && missing+=("swaylock")

# macos commands
[[ "$OSTYPE" == "darwin"* ]] && [ ! $(command -v sketchybar) ] && missing+=("sketchybar")
[[ "$OSTYPE" == "darwin"* ]] && [ ! $(command -v yabai) ] && missing+=("yabai")
[[ "$OSTYPE" == "darwin"* ]] && [ ! $(command -v skhd) ] && missing+=("skhd")
[[ "$OSTYPE" == "darwin"* ]] && [ ! $(command -v xquartz) ] && missing+=("xquartz")

output=''

for i in "${missing[@]}"; do
    output+=$'\n'
    output+="$i"
done

if [[ ! -z "$output" ]]; then
    if [[ $(command -v rich) ]]; then
        header=$'[b yellow underline]List of missing packages[/]\n[yellow]Install these for full functionality![/]\n'
        rich --print -ca rounded "$header$output"
    else
        header=$'List of missing packages\nInstall these for full functionality!\n'
        echo "$header$output"
        echo ""
    fi
fi
