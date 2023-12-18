#!/bin/bash

directoriy="$HOME/.config/waybar/custom_config"
configure="$HOME/.config/waybar/config"
after="/.config/hypr/scripts"

menu() {
    cat <<EOF
costume
costume-clear
costume-short
default-waybar
default-hyprland
default-dots
default-bottom
top(gnome)
bottom(plasma)
simple-short
simple-long
left
right
top-left
top-right
bottom-left
bottom-right
top-&-bottom
all-sides
no panel
EOF
}

apply_config() {
    ln -sf "$directoriy/config-$1" "$configure"
}

main() {
    choice=$(menu | rofi -dmenu -config ~/.config/rofi/config-chage-dock.rasi)

    if [[ -z "$choice" ]]; then
        echo "No option selected. Exiting."
        exit 0
    fi

    case $choice in
        "no panel")
            if pgrep -x "waybar" >/dev/null; then
                pkill waybar
            fi
            exit 0
            ;;
        *)
            apply_config "$choice"
            ;;
    esac
}

# Check if rofi is already running
if pgrep -x "rofi" >/dev/null; then
    pkill rofi
    exit 0
fi

main

exec $after/refresh.sh &