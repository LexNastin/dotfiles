#!/bin/sh

ssdone() {
    RESULT=$(dunstify -i "$SSPATH" "Screenshot taken" "Copied to clipboard.") # -b)
    wl-copy -t "image/png" < "$SSPATH"
    # case "$RESULT" in
    #     "2")
    #         echo editing photo
    #         rm "$SSPATH"
    #         ;;
    #     *)
            rm "$SSPATH"
    #         ;;
    # esac
}

capwindow() {
    RAND=$(cat /dev/urandom | head -c 10 | xxd -p)
    SSPATH="/tmp/screenshot_$RAND.png"
    AWSP=$(hyprctl activeworkspace -j | jq ".id")
    hyprctl clients -j | jq -r ".[] | select(.workspace.id == $AWSP) | .at + .size | map(tostring) | \"\(.[0]),\(.[1]) \(.[2])x\(.[3])\"" \
        | slurp \
        | grim -g - "$SSPATH"
    ssdone
}

capselection() {
    RAND=$(cat /dev/urandom | head -c 10 | xxd -p)
    SSPATH="/tmp/screenshot_$RAND.png"
    AWSP=$(hyprctl activeworkspace -j | jq ".id")
    slurp | grim -g - "$SSPATH"
    ssdone
}

capscreen() {
    RAND=$(cat /dev/urandom | head -c 10 | xxd -p)
    SSPATH="/tmp/screenshot_$RAND.png"
    grim "$SSPATH"
    ssdone
}

case "$1" in
    "window") capwindow
        ;;
    "selection") capselection
        ;;
    "screen") capscreen
        ;;
esac
