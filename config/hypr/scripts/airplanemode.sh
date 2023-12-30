#!/bin/bash

directoriy="$HOME/.config/dunst/icons"

wifistatus=$(nmcli radio wifi)
if [ "$wifistatus" == "enabled" ]; then
    notify-send -t 1000 'airplane mode: inactive' -i "$directoriy/airplane-mode-disabled-symbolic.svg"
else
    notify-send -t 1000 'airplane mode: active' -i "$directoriy/airplane-mode.svg"
fi