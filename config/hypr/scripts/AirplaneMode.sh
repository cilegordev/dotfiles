#!/bin/bash

icon_path="$HOME/.config/dunst/icons"

wifi_status=$(nmcli radio wifi)
if [ "$wifi_status" == "enabled" ]; then
    notify-send -t 1000 'airplane mode: inactive' -i "$icon_path/airplane-mode.svg"
else
    notify-send -t 1000 'airplane mode: active' -i "$icon_path/airplane-mode-disabled-symbolic.svg"
fi
