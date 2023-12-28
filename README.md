# About

- **OS** : [Kali-Linux](https://www.kali.org/)
- **DE** : [Hyprland](https://hyprland.org/)
- **WM** : [Sway](https://swaywm.org/)
- **Themes** : [Adwaita-dark-PONIES](https://github.com/cilegordev/Flat-Adwaita)
- **Icons**: [Flat-ZOMG-dark](https://github.com/cilegordev/Flat-Adwaita)
- **Lockscreen**: [Kali-SDDM](https://github.com/cilegordev/kali-sddm)

## Screenshot

|  Lockscreen  |
|---------|
|  ![](src/sddm.png)  |
| <p align="center"> **Simple but cool** </p> |

|  Desktop Environment  |
|---------|
|  ![](src/sample.png)  |
| <p align="center"> **Classic but cool** </p> |

|  Workspace  |
|---------|
|  ![](src/workspace.png)  |
| <p align="center"> **Multitasking but cool** </p> |

# Dependencies

- **Shell** : zsh
- **Terminal** : xfce4-terminal
- **Text Editor** : code
- **Image Viewer** : shotwell
- **Media Player** : vlc
- **File Manager** : thunar
- **Archive Manager** : file-roller
- **Task Manager** : xfce4-taskmanager
- **Web Browser** : waterfox

  ## Component

  - **brightnessctl**
  - btop
  - cava
  - dunst
  - **grim**
  - hypr
  - **hyprland-plugins**
  - **network-manager**
  - nwg-look
  - **pulseaudio**
  - rofi
  - swappy
  - swaylock
  - swww
  - waybar
  - **wf-recorder**
  - wlogout

  ## Other

  - font-manager
  - gnome-terminal
  - google-chrome-stable
  - htop
  - kitty
  - logo-ls
  - microsoft-edge-stable
  - neofetch
  - nvtop
  - **nwg-dock-hyprland**
  - **nwg-drawer**
  - pipes.sh
  - qterminal
  - radeontop

# To apply

**Note** : There maybe some differences in symlinks so adjust it to yourself
```zsh
git clone https://github.com/cilegordev/dotfiles ~/dotfiles
```

Copy dotfiles
```zsh
cp -r ~/dotfiles/config/* ~/.config/ && cp -r ~/dotfiles/local/* ~/.local/ && cp -r ~/dotfiles/wallpapers ~/Pictures/
```

***If you don't need Xfce you can remove before you copy***

```zsh
rm -rf ~/dotfiles/config/autostart ~/dotfiles/config/menus ~/dotfiles/config/xfce4 ~/dotfiles/config/xsettingsd ~/dotfiles/local/share/applications ~/dotfiles/local/share/desktop-directories
```

If you want Xfce you must install

```zsh
sudo apt install xfce4* kali-grant-root apt-transport-https psutils -y && pip install psutil
```

# Keybinds

| Keys | Output |
| :--  | :-- |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Togglefloating
| <kbd>Super</kbd> + <kbd>W</kbd> | Killactive
| <kbd>Super</kbd> + <kbd>E</kbd> | Fullscreen
| <kbd>Super</kbd> + <kbd>R</kbd> | Refresh Waybar
| <kbd>Super</kbd> + <kbd>T</kbd> | Cava
| <kbd>Super</kbd> + <kbd>Y</kbd> | Pipes.sh
| and use [HINT!](https://raw.githubusercontent.com/cilegordev/dotfiles/main/config/hypr/scripts/keyhints.sh) | for the rest |

# Credits

Installed on : Tuesday, 14 November 2023, 03:00

**Hyprland package currently is not available in any Debian distro repository**

Install Hyprland based Debian distro using script by JaKooLit : [Debian-Hyprland](https://github.com/JaKooLit/Debian-Hyprland) include dotfiles

Forked from [JaKooLit](https://github.com/JaKooLit/Hyprland-Dots) and i'm remake it almost 90%

I can't promise whether these dotfiles work on other machines. and I configured it for 1366x768 not for below or above and maybe it needs a little change in some aspects.

[![Repository status](https://repology.org/badge/vertical-allrepos/hyprland.svg)](https://repology.org/project/hyprland/versions)

And i'll back when a [kali-desktop-hyprland](https://www.kali.org/docs/general-use/metapackages/) [Tracker](https://pkg.kali.org/search?package_name=hyprland) [Index](https://http.kali.org/kali/pool/main/h/hyprland/)
