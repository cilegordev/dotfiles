#!/bin/bash

# Define the path to the swww cache directory
directory="$HOME/.cache/swww/"

# Get a list of monitor outputs
monitor_outputs=($(ls "$directory"))

# Loop through monitor outputs
for output in "${monitor_outputs[@]}"; do
    # Construct the full path to the cache file
    file="$directory$output"

    # Check if the cache file exists for the current monitor output
    if [ -f "$file" ]; then
        # Get the wallpaper path from the cache file
        wallpaper=$(cat "$file")

        # Copy the wallpaper to the location Rofi can access
        ln -sf "$wallpaper" "$HOME/.config/rofi/.wallpaper"

        break  # Exit the loop after processing the first found monitor output
    fi
done


# execute pywal

wal -i $wallpaper
