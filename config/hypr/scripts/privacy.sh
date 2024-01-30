#!/bin/sh

# Still Remember Should I Use Kali Linux?
# DOC https://www.kali.org/docs/introduction/should-i-use-kali-linux/

echo PRIVACY LOCKED 
# amixer sset Capture 25000
# sleep 1
amixer sset Capture 0%
sleep 1
amixer sset Capture nocap
sleep 1
amixer sset Master 75%
sleep 1
sudo rmmod -f uvcvideo
# sleep 1 
# sudo rmmod -f snd_pcm
sleep 1
sudo rmmod -f bluetooth
sleep 1
sudo rfkill block bluetooth
sleep 1
sudo systemctl disable cups
sleep 1
sudo systemctl disable ssh.service
sleep 1
sudo xhost si:localuser:root
echo "\e[1;31mWarning: you are using the root account. You may harm your system 💀\e[0m"
echo DONE! 