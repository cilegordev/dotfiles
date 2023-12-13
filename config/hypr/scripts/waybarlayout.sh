#!/bin/bash

directoriy="$HOME/.config/waybar/custom_config"
configure="$HOME/.config/waybar/config"
after="/.config/hypr/scripts"

menu() {
    cat <<EOF
Costume
Costume-Short
Default-Waybar
Default-Hyprland
Default-Dots
Default-Bottom
Top(gnome)
Bottom(plasma)
Simple-Short
Simple-Long
Left
Right
Top-Left
Top-Right
Bottom-Left
Bottom-Right
Top-&-Bottom
All-Sides
No Panel
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
