#!/bin/bash

directory="$HOME/.config/swaylock/config"

brightnessctl set 1%; swaylock --config ${directory} -f; disown
