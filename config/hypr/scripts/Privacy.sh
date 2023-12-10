#!/bin/sh

amixer sset Capture 0% && 
sleep 1
amixer sset Capture nocap && 
sleep 1
amixer sset Master 75%
sleep 1
sudo rmmod -f uvcvideo
