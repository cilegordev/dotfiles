#!/bin/bash

directory="$HOME/.config/dunst/icons"

time=$(date +%Y_%m_%d_%H_%M_%S)
location="$(xdg-user-dir)/Pictures/Screenshots"
file="Screenshot_${time}_${RANDOM}.png"

# notify and view screenshot
notifytakescreenshot="notify-send -h string:x-canonical-private-synchronous:shot-notify -u low -i ${directory}/multimedia-photo-viewer.svg"
notify_view() {
	${notifytakescreenshot} "Copied to clipboard."
##	viewnior ${dir}/"$file"
	if [[ -e "$location/$file" ]]; then
		${notifytakescreenshot} "Screenshot Saved."
	else
		${notifytakescreenshot} "Screenshot Deleted."
	fi
}

# countdown
countdown() {
	for sec in $(seq $1 -1 1); do
		notify-send -h string:x-canonical-private-synchronous:shot-notify -t 1000 -i "$directory"/timer.png "Screenshot Countdown : $sec"
		sleep 1
	done
}

# take shots
shotnow() {
	cd ${location} && grim - | tee "$file" | wl-copy
	sleep 2
	notify_view
}

shot5() {
	countdown '5'
	sleep 1 && cd ${location} && grim - | tee "$file" | wl-copy
	sleep 1
	notify_view
	
}

shot10() {
	countdown '10'
	sleep 1 && cd ${location} && grim - | tee "$file" | wl-copy
	notify_view
}

shotwin() {
	wallpaperat=$(hyprctl activewindow | grep 'at:' | cut -d':' -f2 | tr -d ' ' | tail -n1)
	wallpapersize=$(hyprctl activewindow | grep 'size:' | cut -d':' -f2 | tr -d ' ' | tail -n1 | sed s/,/x/g)
	cd ${location} && grim -g "$wallpaperat $wallpapersize" - | tee "$file" | wl-copy
	notify_view
}

shotarea() {
	cd ${location} && grim -g "$(slurp)" - | tee "$file" | wl-copy
	notify_view
}

if [[ ! -d "$location" ]]; then
	mkdir -p "$location"
fi

if [[ "$1" == "--now" ]]; then
	shotnow
elif [[ "$1" == "--in5" ]]; then
	shot5
elif [[ "$1" == "--in10" ]]; then
	shot10
elif [[ "$1" == "--win" ]]; then
	shotwin
elif [[ "$1" == "--area" ]]; then
	shotarea
else
	echo -e "Available Options : --now --in5 --in10 --win --area"
fi

exit 0
