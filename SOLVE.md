# KNOW ISSUE

I add package for xfce like ``kali-grant-root apt-transport-https psutils`` <br>
use this for configure. <br>
use sodo without asking password. <br>
``sudo dpkg-reconfigure kali-grant-root`` <br>
then <br>
``Enable password-less privilege escalation`` <br>
one more step <br>
``sudo visudo`` <br>
then <br>
``root``    ``ALL=(ALL:ALL) ALL`` <br>
``user``    ``ALL=(ALL:ALL) ALL`` <br>

add **https** on your ``/etc/apt/sources.list`` <br>
``sudo nano /etc/apt/sources.list`` <br>
``deb https://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware`` <br>
``deb-src https://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware`` <br>

if xfce panel backup can't open or force close. <br>
just install psutils ``pip install psutil`` <br>

If you have trouble **wlan0** can't detect on **nm-applet** and it say **"Device Not Ready"** <br>
just remove all **Ethernet** on list. <br>

If you have trouble when doing full screen on the application and it appears like a green splash. <br>
try changing it ``vrr = 0`` on ``~/.config/hypr/hyprland.conf`` <br>

The sound will automatically be set at 75% and the mic will be disabled on startup. <br>
Because I have made a special script for that ``~/.config/hypr/scripts/privacy.sh`` <br>

If you need open thunar as root <br>
``sudo thunar`` and it say <br>
``(thunar:00000): Gtk-WARNING **: 00:00:00.000: cannot open display: :1`` <br>
just open ``sudo -EH thunar`` <br>

Don't try ``systemctl suspend`` use ``hyprctl dispatch dpms off`` on Hyprland. <br>
cause it will make your broken screen 50/50 <br>

If you annoying sound **"beeb" "beeb" "beeb"** on terminal or tty. <br>
just turn turn off with use the one I have provided in .zshrc <br>
``# disable beeb sound effect`` <br>
``#setterm --bfreq=0`` <br>
``#xset b off`` <br>

if you don't want **"core"** in your home directory. <br>
just reconfigure with ``nano /etc/sysctl.conf`` <br>
move <br>
``kern.corefile=/var/log``                   ``#move it to directory`` <br>
or disable it <br>
``kern.coredump=0``                          ``#disable coredump`` <br>
``kern.corefile=/dev/null``                  ``#move it to directory`` <br>