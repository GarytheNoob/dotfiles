#!/bin/bash

confirmLeave(){
    if [ $(( $RANDOM % 2 )) == 1 ]; then
        echo -e "NO\nYES" | rofi -dmenu -p "Are you sure? You are leaving dwm."
    else
        echo -e "YES\nNO" | rofi -dmenu -p "Are you sure? You are leaving dwm."
    fi
}

leaveDwm(){
    chosen="$(confirmLeave)"
    if [[ "$chosen" == "YES" ]]; then
        exec killall dwm
    else
        exit 0
    fi
}

initMenu(){
    menu="Switch Services\nConfig Wi-Fi\nRandom Wallpaper\nSet Monitor"
    if [ -n "$(pgrep dwm)" ]; then
        menu="$menu\nLeave dwm"
    fi
    echo -e "$menu" | rofi -dmenu -p "Choose function"
}

# main

choice="$(initMenu)"
case "$choice" in
    "Switch Services")
        bash $HOME/script/configservice.sh
        ;;
    "Config Wi-Fi")
        bash $HOME/script/rofi-wifi-menu.sh
        ;;
    "Random Wallpaper")
        bash $HOME/script/wallpaper.sh -r && notify-send "Wallpaper changed successfully ."
        ;;
    "Leave dwm")
        leaveDwm
        ;;
esac
