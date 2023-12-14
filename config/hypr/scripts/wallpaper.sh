#!/bin/bash

directory=$HOME/Pictures/wallpapers/
piture=($(find ${directory} -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \)))
randomselect=${piture[ $RANDOM % ${#piture[@]} ]}

change_swaybg(){
  pkill swww
  pkill swaybg
  swaybg -m fill -i ${randomselect}
}

change_swww(){
  pkill swaybg
  swww query || swww init
  swww img ${randomselect} --transition-fps 30 --transition-type any --transition-duration 3
}

change_current(){
  if pidof swaybg >/dev/null; then
    change_swaybg
  else
    change_swww
  fi
}

switch(){
  if pidof swaybg >/dev/null; then
    change_swww
  else
    change_swaybg
  fi
}

case "$1" in
	"swaybg")
		change_swaybg
		;;
	"swww")
		change_swww
		;;
  "s")
		switch
		;;
	*)
		change_current
		;;
esac

exec $HOME/.config/hypr/scripts/ywalswww.sh &
sleep 1
