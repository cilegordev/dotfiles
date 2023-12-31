#!/bin/bash

icon_path="$HOME/.config/dunst/icons"

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0;\
        keyword plugin:hyprbars 0" #for this part I still haven't found a way to disable hyprbars using hyprctl
    swww kill 
    pkill waybar
    notify-send "animations off" -i "$icon_path/applications-games-symbolic.svg"
    exit
fi
hyprctl reload