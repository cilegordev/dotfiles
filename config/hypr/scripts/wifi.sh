#!/bin/bash

icon_path="$HOME/.config/dunst/icons"

connected=false

while true; do
    current_ssid=$(iwgetid -r)

    if [ -n "$current_ssid" ]; then
        if [ "$connected" = false ]; then
            connected=true
            notify-send "$current_ssid" "The network connection has been established." -i "$icon_path/network-wired-online.svg"
        fi
    else
        if [ "$connected" = true ]; then
            connected=false
            notify-send "Disconnected" "The network connection has been disconnected." -i "$icon_path/network-wired-offline.svg"
        fi
    fi
    sleep 1
done
