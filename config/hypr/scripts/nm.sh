#!/bin/bash

echo -e "\e[31mGenerate Wi-Fi please wait...\e[0m"
nmcli device wifi list | awk 'NR>1 {print $0}'

echo -e "\e[31mUse \"\\\" instead of spaces.\e[0m"
read -p "SSID: " ssid
read -s -p "Password: " password
echo

nmcli device wifi connect "$ssid" password "$password"

echo "Done. bye! bye! "