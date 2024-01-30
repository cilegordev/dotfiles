#!/bin/bash

icon="$HOME/.config/dunst/icons"

while true; do
    current_hour=$(date +%H:%M)
    if [ $current_hour == 03:00 ]; then
    notify-send -t 600000 "Ingin melaksanakan Sholat Tahajud?" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Hanya lah doa yang mampu mengubah takdir."
    elif [ $current_hour == 04:00 ]; then
    notify-send -t 600000 "Tiba waktu Sholat Subuh" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Kenapa udara Shubuh itu sejuk? Karena belum bercampur dengan nafas orang munafik."
    elif [ $current_hour == 08:00 ]; then
    notify-send -t 600000 "Ingin melaksanakan Sholat Dhuha?" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Rezeki seret? Maka perbayak lah Sholat Dhuha."
    elif [ $current_hour == 12:00 ]; then
    notify-send -t 600000 "Tiba waktu Sholat Zuhur" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Menggangur hanyalah selingan waktu menunggu waktu Sholat tiba."
    elif [ $current_hour == 16:00 ]; then
    notify-send -t 600000 "Tiba waktu Sholat Asar" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Maka akan sia - sia amalan dari pagi hingga sore bila melewatkan Sholat Ashar."
    elif [ $current_hour == 18:00 ]; then
    notify-send -t 600000 "Tiba waktu Sholat Magrib" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "2 yang tiada 2nya adalah bergantinya matahari pagi menjadi bulan malam."
    elif [ $current_hour == 19:00 ]; then
    notify-send -t 600000 "Tiba waktu Sholat Isya" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Malaikat Jibril pernah melihat Najmu Ahmad sebanyak 70.000 kali."
    elif [ $current_hour == 22:00 ]; then
    notify-send -t 600000 "Tiba waktu untuk Tidur" -i "$icon/timer.png"
    notify-send -t 600000 "Current splash:" "Malam yang tenang. Tapi ini bukan tentang malam tapi bagaimana caranya menyambut esok hari."
    fi
    sleep 60
done