#!/bin/bash

directoriy=~/.cache/rbn
file=${0##*/}-$1

if [ ! -d $directoriy ]; then
    mkdir -p $directoriy
fi

if [ ! -f $directoriy/$file ]; then
    touch $directoriy/$file
fi

# Change IFS to new line.
separator=$'\n'

# Save current IFS
new=$separator

cacheage=$(($(date +%s) - $(stat -c '%Y' "$directoriy/$file")))
if [ $cacheage -gt 1740 ] || [ ! -s $directoriy/$file ]; then
    data=($(curl -s https://en.wttr.in/"$city"$1\?0qnT 2>&1))
    echo ${data[0]} | cut -f1 -d, > $directoriy/$file
    echo ${data[1]} | sed -E 's/^.{15}//' >> $directoriy/$file
    echo ${data[2]} | sed -E 's/^.{15}//' >> $directoriy/$file
fi

weather=($(cat $directoriy/$file))

# Restore IFSClear
separator=$new

temperature=$(echo ${weather[2]} | sed -E 's/([[:digit:]]+)\.\./\1 to /g')

#echo ${weather[1]##*,}

# https://fontawesome.com/icons?s=solid&c=weather
case $(echo ${weather[1]##*,} | tr '[:upper:]' '[:lower:]') in
"clear" | "sunny")
    condition=""
    ;;
"partly cloudy")
    condition="󰖕"
    ;;
"cloudy")
    condition=""
    ;;
"overcast")
    condition=""
    ;;
"fog" | "freezing fog")
    condition=""
    ;;
"patchy rain possible" | "patchy light drizzle" | "light drizzle" | "patchy light rain" | "light rain" | "light rain shower" | "mist" | "rain")
    condition="󰼳"
    ;;
"moderate rain at times" | "moderate rain" | "heavy rain at times" | "heavy rain" | "moderate or heavy rain shower" | "torrential rain shower" | "rain shower")
    condition=""
    ;;
"patchy snow possible" | "patchy sleet possible" | "patchy freezing drizzle possible" | "freezing drizzle" | "heavy freezing drizzle" | "light freezing rain" | "moderate or heavy freezing rain" | "light sleet" | "ice pellets" | "light sleet showers" | "moderate or heavy sleet showers")
    condition="󰼴"
    ;;
"blowing snow" | "moderate or heavy sleet" | "patchy light snow" | "light snow" | "light snow showers")
    condition="󰙿"
    ;;
"blizzard" | "patchy moderate snow" | "moderate snow" | "patchy heavy snow" | "heavy snow" | "moderate or heavy snow with thunder" | "moderate or heavy snow showers")
    condition=""
    ;;
"thundery outbreaks possible" | "patchy light rain with thunder" | "moderate or heavy rain with thunder" | "patchy light snow with thunder")
    condition=""
    ;;
*)
    condition=""
    echo -e "{\"text\":\""$condition"\", \"alt\":\""${weather[0]}"\", \"tooltip\":\""${weather[0]}: $temperature ${weather[1]}"\"}"
    ;;
esac

#echo $temp $condition

echo -e "{\"text\":\""$temperature $condition"\", \"alt\":\""${weather[0]}"\", \"tooltip\":\""${weather[0]}: $temperature ${weather[1]}"\"}"
