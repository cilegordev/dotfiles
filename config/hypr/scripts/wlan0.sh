#!/bin/sh

# sudo ifdown wlan0 &&
# sleep 1 
nmcli radio wifi off &&
sleep 1 
nmcli radio wifi on && 
sleep 1
amixer sset Capture 30% && 
sleep 1
amixer sset Capture nocap && 
sleep 1
amixer sset Master 75%
