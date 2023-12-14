#!/bin/bash

directory=$HOME/.config/hypr/scripts

# Kill already running process
notification=(waybar mako dunst rofi nwg-dock-hyprland nwg-panel)
for on in "${notification[@]}"; do
	if [[ $(pidof ${on}) ]]; then
		pkill ${on}
	fi
done

# Lauch notification daemon (dunst)
${directory}/dunst.sh &

# Lauch statusbar (waybar)
${directory}/waybar.sh &

# Lauch dock (nwg-dock-hyprland)
nwg-dock-hyprland &
