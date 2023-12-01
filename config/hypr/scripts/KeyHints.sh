#!/bin/bash

yad --width=1000 --height=1000 \
--center \
--title="Keybindings" \
--no-buttons \
--list \
--column=Key: \
--column=Description: \
--column=Command: \
--timeout=60 \
--timeout-indicator=bottom \
" + ENTER" "Open Terminal" "Command Prompt" \
" + SPACE" "Chage Wallpaper" "Swww" \
" + R" "Refresh Configure" "Waybar" \
" + Q" "Minimize" "Hide waybar" \
" + W" "Close" "Kill Active Programs" \
" + E" "Fullscreen" "Full Screen Programs" \
" + A" "Open File Manager" "Files" \
" + S" "Open Web Browser" "Browsers" \
" + D" "Open Menu" "Show Menus" \
" + Z" "Unfocuse Window" "Toggle Floating" \
" + X" "Open Task Manager" "Task Manager" \
" + C" "Action Control" "Wlogout" \
" + 1-0" "Move Workspace" "Workspace" \
" + LEFT, RIGHT, UP, DOWN" "Move Window" "Workspace" \
" + CLICK" "Toggle Floating" "Move Window" \
"wf-recorder -a -f capture.mp4" "RECORD MY DESKTOP" "TERMINAL" \
"pipes.sh" "TEST COLOR TERMINAL" "TERMINAL" \
"" "" "" \
"AUTO CLOSE" "AFTER READ" "60 SECOND" \
