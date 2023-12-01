# Hyprland 2023
Install Hyprland based Debian distro using script by JaKooLit : [Debian-Hyprland](https://github.com/JaKooLit/Debian-Hyprland)
# About

- **OS** : [Kali-Linux](https://www.kali.org/)
- **DE** : [Hyprland](https://hyprland.org/)
- **WM** : [Sway](https://swaywm.org/)
- **Themes** : [Adwaita-dark-PONIES](https://github.com/cilegordev/Flat-Adwaita)
- **Icons**: [Flat-ZOMG-dark](https://github.com/cilegordev/Flat-Adwaita)
- **Lockscreen**: [Kali-SDDM](https://github.com/cilegordev/kali-sddm)

## Screenshot

Lockscreen : simple but cool
![](src/sddm.png)

DE : classic but cool
![](src/hyprland.png)

# Dependencies

- **Shell** : zsh
- **Terminal** : xfce4-terminal
- **Text Editor** : mousepad
- **File Manager** : thunar
- **Task Manager** : xfce4-taskmanager
- **Web Browser** : waterfox

  ## Component
  - btop
  - cava
  - dunst
  - hypr
  - **network-manager**
  - nwg-look
  - **pulseaudio**
  - rofi
  - swappy
  - swaylock
  - waybar
  - **wf-recorder**
  - wlogout

  ## Other
  - htop
  - logo-ls
  - neofetch
  - nvtop
  - pipes.sh
  - radeontop

# To apply

```bash
cp dotfiles/config/* $Home/.config/
cp dotfiles/local/* $Home/.local/
cp -r dotfiles/wallpapers $Home/Pictures/
sudo -E cp dotfiles/wlan0 /etc/init.d/
```

# Credits

- Forked from [JaKooLit](https://github.com/JaKooLit/Hyprland-Dots)