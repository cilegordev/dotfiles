#!/bin/bash

configure="$HOME/.config/waybar/config"
style="$HOME/.config/waybar/style.css"

if [[ ! $(pidof waybar) ]]; then
	waybar --bar main-bar --log-level error --config ${configure} --style ${style}
fi
