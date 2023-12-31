#!/bin/bash

directoriy="$HOME/.config/dunst/icons"

command=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $command in
"master")
	hyprctl keyword general:layout dwindle
	hyprctl keyword unbind SUPER,J
	hyprctl keyword unbind SUPER,K
	hyprctl keyword bind SUPER,J,cyclenext
	hyprctl keyword bind SUPER,K,cyclenext,prev
	hyprctl keyword bind SUPER,O,togglesplit
  notify-send "Dwindle Layout" -i "$directoriy/swap-panels.svg"
	;;
"dwindle")
	hyprctl keyword general:layout master
	hyprctl keyword unbind SUPER,J
	hyprctl keyword unbind SUPER,K
	hyprctl keyword unbind SUPER,O
	hyprctl keyword bind SUPER,J,layoutmsg,cyclenext
	hyprctl keyword bind SUPER,K,layoutmsg,cycleprev
  notify-send "Master Layout" -i "$directoriy/snap-bounding-box-edges.svg"
	;;
*) ;;

esac