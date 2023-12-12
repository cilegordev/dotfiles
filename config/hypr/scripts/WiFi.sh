#!/bin/bash

icon_path="$HOME/.config/dunst/icons"
while :
do
ssid=$(nmcli -t -f active,ssid dev wifi | awk -F: '$1=="yes" {print $2}')
if [ -n "$ssid" ]; then
    notify-send "$ssid" "The network connection has been established." -i "$icon_path/network-wired-online.svg"
break
else
    notify-send "Disconnected" "The network connection has been disconnected." -i "$icon_path/network-wired-offline.svg"
fi
  break
  sleep 4
done
