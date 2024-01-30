#!/bin/bash

brightness_set=false 

swaylock &

while true; do
    if pgrep -x "swaylock" > /dev/null; then
        if [ "$brightness_set" = false ]; then
            brightnessctl set 1%
            brightness_set=true
        fi
    else
        brightnessctl set 4%
        brightness_set=false
    fi
    if ! pgrep -x "swaylock" > /dev/null; then
        break
    fi
    sleep 1
done