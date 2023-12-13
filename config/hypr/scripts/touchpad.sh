#!/bin/bash

# NOTE: find the right device using hyprctl devices
 
touchpadid="asue1209:00-04f3:319f-touchpad"

if [ -z "$XDG_RUNTIME_DIRECTORY" ]; then
  export XDG_RUNTIME_DIRECTORY=/run/user/$(id -u)
fi

export statusdevice="$XDG_RUNTIME_DIRECTORY/touchpad.status"

enable_touchpad() {
  printf "true" > "$statusdevice"

  notify-send -u normal "Enabling Touchpad"

  hyprctl keyword "device:$touchpadid:enabled" true
}

disable_touchpad() {
  printf "false" > "$statusdevice"

  notify-send -u normal "Disabling Touchpad"

  hyprctl keyword "device:$touchpadid:enabled" false
}

if ! [ -f "$statusdevice" ]; then
  enable_touchpad
else
  if [ $(cat "$statusdevice") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$statusdevice") = "false" ]; then
    enable_touchpad
  fi
fi
