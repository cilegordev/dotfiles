#!/bin/bash

after="/.config/hypr/scripts"

# ACTUAL THEME
theme=$(realpath ~/.config/waybar/style.css | sed 's/.*-\(.*\)\.css/\1/')

# Array for the style
style=(
"costume"
"costume-colorful"
"default-waybar"
"default-hyprland"
"pywal" 
"dark" 
"light" 
"black-&-white" 
"colors" 
"colors-border" 
"colors-line" 
"colorful" 
"catppuccin-mocha" 
"catppuccin-latte"
)

# Build ROFI
selectstyle=$(printf "%s\n" "${style[@]}" | rofi -dmenu -config ~/.config/rofi/config-chage-style.rasi "${#style[@]}")

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

# Verify the selected theme
if [[ " ${style[@]} " =~ " $selectstyle " ]]; then
    switchto="${selectstyle}"
else
    echo "Invalid selection"
    exit 1
fi

# APPLY THEME
themedirectoriy="$HOME/.config/waybar/style/style-${switchto}.css"
if [ -f "$themedirectoriy" ]; then
    ln -sf "$themedirectoriy" "$HOME/.config/waybar/style.css"
else
    echo "Error: $themedirectoriy not found"
    exit 1
fi

# Restart relevant processes
for process in waybar mako dunst; do
    if pidof "$process" > /dev/null; then
        pkill "$process"
    fi
done

exec $after/refresh.sh
