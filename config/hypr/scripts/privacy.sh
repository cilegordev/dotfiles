#!/bin/sh
# Still Remember Should I Use Kali Linux?
## DOC https://www.kali.org/docs/introduction/should-i-use-kali-linux/

#amixer sset Capture 2500
#sleep 1
amixer sset Capture 0%
sleep 1
amixer sset Capture nocap
sleep 1
amixer sset Master 75%
sleep 1
sudo rmmod -f uvcvideo
# sleep 1 
# sudo rmmod -f snd_hda_codec_realtek
sleep 1
sudo rmmod -f bluetooth
sleep 1
sudo systemctl disable cups
sleep 1
sudo systemctl disable ssh.service