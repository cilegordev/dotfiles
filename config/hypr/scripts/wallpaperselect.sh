#!/bin/bash
# WALLPAPERS PATH
directoriy=$HOME/Pictures/wallpapers
# Transition config
fps=30
type="simple"
duration=3
swww_parameter="--transition-fps $fps --transition-type $type --transition-duration $duration"

# Check if swaybg is running
if pidof swaybg > /dev/null; then
  pkill swaybg
fi

# Retrieve image files
picture=($(ls "${directoriy}" | grep -E ".jpg$|.jpeg$|.png$|.gif$"))
randompicture="${picture[$((random % ${#picture[@]}))]}"
name="${#picture[@]}. random"

# Rofi command
rofi_command="rofi -dmenu -config ~/.config/rofi/config-chage-wallpaper.rasi"

menu() {
  for i in "${!picture[@]}"; do
    # Displaying .gif to indicate animated images
    if [[ -z $(echo "${picture[$i]}" | grep .gif$) ]]; then
      printf "$i. $(echo "${picture[$i]}" | cut -d. -f1)\n"
    else
      printf "$i. ${picture[$i]}\n"
    fi
  done

  printf "$name"
}

swww query || swww init

main() {
  choice=$(menu | ${rofi_command})

  # No choice case
  if [[ -z $choice ]]; then
    exit 0
  fi

  # random choice case
  if [ "$choice" = "$name" ]; then
    swww img "${directoriy}/${randompicture}" $swww_parameter
    exit 0
  fi

  picturedirectoriy=$(echo "$choice" | cut -d. -f1)
  swww img "${directoriy}/${picture[$picturedirectoriy]}" $swww_parameter
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
  exit 0
fi

main

$HOME/.config/hypr/scripts/pywalswww.sh &