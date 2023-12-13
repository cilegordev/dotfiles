#!/bin/bash

directory="$HOME/.config/dunst/dunstrc"

if [[ ! $(pidof dunst) ]]; then
	dunst -conf ${directory}
fi
