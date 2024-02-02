#!/bin/bash

read -p "Do you wan't xfce4 files? [Y/N]: " xfcedotfiles

sourceHypr=~/dotfiles/config/hypr
targetHypr=~/.config/hypr
backupHypr=~/.config/hypr-backup

sourceCache=~/dotfiles/cache
targetCache=~/.cache

sourceConfig=~/dotfiles/config
targetConfig=~/.config

sourceLocal=~/dotfiles/local
targetLocal=~/.local

sourceWallpapers=~/dotfiles/wallpapers
targetWallpapers=~/Pictures

sourceHome=~/dotfiles/home
targetHome=~/

# Function to copy and handle backups
copy_with_backup() {
  sourceDir=$1
  targetDir=$2
  backupDir=$targetDir-backup

  # Check if the target directory exists
  if [ -d "$targetDir" ]; then
    echo "folder $targetDir exist, creating backup..."
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

# Copy each directory
copy_with_backup "$sourceHypr" "$targetHypr"
copy_with_backup "$sourceCache" "$targetCache"
copy_with_backup "$sourceConfig" "$targetConfig"
copy_with_backup "$sourceLocal" "$targetLocal"
cp -r "$sourceWallpapers" "$targetWallpapers"

# Copy individual files
copy_file "$sourceHome/.bashrc" "$targetHome/.bashrc"
copy_file "$sourceHome/.face" "$targetHome/.face"
copy_file "$sourceHome/.hushlogin" "$targetHome/.hushlogin"
copy_file "$sourceHome/.twmrc" "$targetHome/.twmrc"
copy_file "$sourceHome/.zsh_history" "$targetHome/.zsh_history"
copy_file "$sourceHome/.zshrc" "$targetHome/.zshrc"
copy_file "$sourceHome/capture-sddm.sh" "$targetHome/capture-sddm.sh"
copy_file "$sourceHome/update.sh" "$targetHome/update.sh"
# Add more copy_file lines for other files as needed

echo "Hyprland dotfiles installed."
