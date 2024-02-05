#!/bin/bash

read -p "Do you wan't xfce files? [Y/N]: " xfcedotfiles

sourceCache=~/dotfiles/cache
targetCache=~/.cache

sourceConfig=~/dotfiles/config
targetConfig=~/.config

sourceLocal=~/dotfiles/local
targetLocal=~/.local

sourceWallpapers=~/dotfiles/wallpapers
targetWallpapers=~/Pictures

# Function to copy and handle backups
copy_with_backup() {
  sourceDir=$1
  targetDir=$2
  backupDir=$targetDir-backup

  # Check if the target directory exists
  if [ -d "$targetDir" ]; then
    echo "folder $targetDir exists, backup created..."
    mv "$targetDir" "$backupDir"
  fi

  # Copy the source directory to the target
  cp -r "$sourceDir" "$targetDir"
}

# Function to copy individual files
copy_file() {
  sourceFile=$1
  targetFile=$2

  # Copy the source file to the target
  cp "$sourceFile" "$targetFile"
}

# Install XFCE or remove XFCE-related packages based on user input
if [ "$xfcedotfiles" == "Y" ] || [ "$xfcedotfiles" == "y" ]; then
  sudo apt install xfce4* kali-grant-root apt-transport-https psutils -y
  pip install psutil
  clear
else
  # Remove XFCE-related packages
  rm -rf ~/dotfiles/config/autostart ~/dotfiles/config/menus ~/dotfiles/config/xfce4 ~/dotfiles/config/xsettingsd ~/dotfiles/local/share/applications ~/dotfiles/local/share/desktop-directories
  clear
fi

# Create ~/Pictures/wallpapers if it doesn't exist, make backup if it does
if [ ! -d "$targetWallpapers" ]; then
  mkdir -p "$targetWallpapers"
else
  echo "folder $targetWallpapers exists, backup created..."
  mv "$targetWallpapers" "$targetWallpapers-backup"
  mkdir -p "$targetWallpapers"
fi

# Copy each directory
copy_with_backup "$sourceCache" "$targetCache"
copy_with_backup "$sourceConfig" "$targetConfig"
copy_with_backup "$sourceLocal" "$targetLocal"
cp -r "$sourceWallpapers" "$targetWallpapers"

# Copy individual files
rm ~/dotfiles/home/.Hyprland*
sleep 1
cp -r ~/dotfiles/home/.* ~/dotfiles/home/* ~/
sleep 0.5
clear

# Generate symlink
echo Add dunstrc
ln -sf ~/.config/dunst/styles/dunstrc-dark ~/.config/dunst/dunstrc
sleep 0.5
echo Add config
ln -sf ~/.config/waybar/custom_config/config-costume-short ~/.config/waybar/config
sleep 0.5
echo Add style.css
ln -sf ~/.config/waybar/style/style-costume-colorful.css ~/.config/waybar/style.css
sleep 0.5
echo Add .wallpaper
ln -sf ~/Pictures/wallpapers/exclsv/echo_hello_world.png ~/.config/rofi/.wallpaper
sleep 0.5
echo Add dunstrc
ln -sf ~/.config/dunst/styles/dunstrc-dark ~/.config/dunst/styles/dunstrc
sleep 0.5
echo Add pywal-theme.rasi
ln -sf ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/pywal-color/pywal-theme.rasi
sleep 0.5

echo "Hyprland dotfiles installed."