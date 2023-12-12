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
" + ~" "Open Terminal" "Command Prompt" \
" + Q" "Unfocuse Window" "Toggle Floating" \
" + W" "Close" "Kill Active Programs" \
" + E" "Fullscreen" "Full Screen Programs" \
" + R" "Refresh Configure" "Waybar" \
" + T" "Open Cava" "Cava" \
" + Y" "Open Pipes.sh" "Test Colors" \
" + A" "Open File Manager" "Files" \
" + S" "Open Web Browser" "Browsers" \
" + D" "Open Menu" "Show Menus" \
" + Z" "Open Task Manager" "Task Manager" \
" + X" "Open Text Editor" "Edit" \
" + C" "Minimize" "Hide waybar" \
" + M" "Record My Desktop" "Recorder" \
" + ENTER" "Open Terminal" "Command Prompt" \
" + SPACE" "Chage Wallpaper" "Swww" \
" + 1-0" "Move Workspace" "Workspace" \
" + LEFT, RIGHT, UP, DOWN" "Move Window" "Workspace" \
" + CLICK" "Toggle Floating" "Move Window" \
"" "" "" \
"AUTO CLOSE" "AFTER READ" "60 SECOND" \
