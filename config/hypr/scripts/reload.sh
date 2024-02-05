#!/bin/bash

directory=$HOME/.config/hypr/scripts

# Kill already running process
notification=(waybar dunst rofi)
for on in "${notification[@]}"; do
	if [[ $(pidof ${on}) ]]; then
		pkill ${on}
		pkill -f nwg*
	fi
done

# Lauch notification daemon (dunst)
${directory}/dunst.sh &

# Lauch statusbar (waybar)
${directory}/waybar.sh &

# Lauch bar (nwg-panel)
# nwg-panel &

# Lauch dock (nwg-dock-hyprland)
nwg-dock-hyprland -d -hd 0 -i 40 -mb 5 &

# Reload Kitty Terminal (window-size)
echo '{"window-size": [640, 280]}' > .cache/kitty/main.json

# Get superuser privileges
xhost si:localuser:root
echo -e "\e[1;31mWarning: you are using the root account. You may harm your system 💀\e[0m"

# Refresh (hyprland)
hyprctl reload