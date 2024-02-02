#!/bin/bash

icon="$HOME/.config/dunst/icons"

last_battery_status=""
last_battery_charge=""
last_charger_status=""

threshold=80

while true; do
    battery_status="$(cat /sys/class/power_supply/BAT0/status)"
    battery_charge="$(cat /sys/class/power_supply/BAT0/capacity)"
    if [ "$battery_status" != "$last_battery_status" ] || [ "$battery_charge" != "$last_battery_charge" ]; then
        if [ "$battery_charge" -eq 10 ]; then
            notify-send "$battery_charge% Battery is critically low" "Plug in the charger immediately!" -i "$icon/battery-missing.svg"
        elif [ "$battery_charge" -eq 20 ]; then
            notify-send "$battery_charge% Battery is low" "Please plug in the charger" -i "$icon/battery-caution.svg"
        elif [ "$battery_charge" -eq 100 ]; then
            notify-send "$battery_charge% Battery is full" "Please unplug the charger" -i "$icon/battery-full.svg"
        fi
        last_battery_status="$battery_status"
        last_battery_charge="$battery_charge"
        sleep 3
    fi

    battery_good=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage:" | awk '{print $2}' | tr -d '%')
    if [ "$battery_good" -ge "$threshold" ] && [ "$battery_charge" -lt 80 ]; then
        notify-send "$battery_charge% Battery is almost full" "Please unplug the charger" -i "$icon/battery-good.svg"
        sleep 3
    fi

    charger_status="$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state" | awk '{print $2}')"
    if [ "$charger_status" != "$last_charger_status" ]; then
        if [ "$charger_status" == "charging" ]; then
            notify-send "Charger connected" -i "$icon/ac-adapter.svg"
        elif [ "$charger_status" == "discharging" ]; then
            notify-send "Charger disconnected" -i "$icon/preferences-system-power.svg"
        fi
        last_charger_status="$charger_status"
        sleep 3
    fi

    sleep 3
done

# Please note that this is a shell script and not a system program so it is far from perfect