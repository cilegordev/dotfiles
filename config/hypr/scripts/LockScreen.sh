#!/bin/bash

CONFIG="$HOME/.config/swaylock/config"

brightnessctl set 1%; swaylock --config ${CONFIG} -f; disown
