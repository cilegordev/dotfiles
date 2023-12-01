#!/usr/bin/bash
time=$(date +"%H:%M %d/%m/%Y")
columns=$(tput cols)
text="-= $time =-"
padding=$((($columns - ${#text}) / 2))
printf "%*s%s\n" $padding "" "$text"
#printf "\e]2;Updateing ...\a"
columns=$(tput cols)
text="----------------------------------------------=UPDATE=----------------------------------------------"
padding=$((($columns - ${#text}) / 2))
printf "%*s%s\n" $padding "" "$text"
apt update -y
columns=$(tput cols)
text="----------------------------------------------=UPGRADE=---------------------------------------------"
padding=$((($columns - ${#text}) / 2))
printf "%*s%s\n" $padding "" "$text"
apt upgrade -y
columns=$(tput cols)
text="-----------------------------------------------=CLEAN=----------------------------------------------"
padding=$((($columns - ${#text}) / 2))
printf "%*s%s\n" $padding "" "$text"
apt autoremove -y
apt autoclean -y
columns=$(tput cols)
text="-----------------------------------------------=DONE=-----------------------------------------------"
padding=$((($columns - ${#text}) / 2))
printf "%*s%s\n" $padding "" "$text"
time=$(date +"%Y-%m-%d %H:%M:%S")
columns=$(tput cols)
text="-= $time =-"
padding=$((($columns - ${#text}) / 2))
printf "%*s%s\n" $padding "" "$text"
read -n 1 -r -s -p $'[Y] Continue Terminal 
[N] Exit
[1] Full Upgrade
[2] List Upgradable\n'
echo
if [[ $REPLY == "1" ]]; then
    apt full-upgrade
    read -n 1 -r -s -p $''
elif [[ $REPLY == "2" ]]; then
    apt list --upgradable
    read -n 1 -r -s -p $''
fi
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 0
else
    zsh
fi
