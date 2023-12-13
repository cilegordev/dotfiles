#!/bin/bash
sleep 1
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
killall xdg-desktop-portal-gnome
killall xdg-desktop-portal-kde
killall xdg-desktop-portal-hyprland

sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
/usr/libexec/xdg-desktop-portal-hyprland &

sleep 1
/usr/lib/xdg-desktop-portal-hyprland &
/usr/libexec/xdg-desktop-portal &

