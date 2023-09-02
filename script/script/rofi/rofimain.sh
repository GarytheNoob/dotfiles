#!/bin/bash

confirmLeave(){
    if [ $(( $RANDOM % 2 )) == 1 ]; then
        echo -e "NO\nYES" | exec rofi -dmenu -p "Are you sure? You are leaving dwm."
    else
        echo -e "YES\nNO" | exec rofi -dmenu -p "Are you sure? You are leaving dwm."
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
    menu="Config services\nConfig Wi-Fi\nChange Wallpaper\nSet Monitor\nLeave dwm" 
    echo -e "$menu" | exec rofi -dmenu -p "Choose function"
}

# main

cd "/home/GarytheNoob/script"
choice="$(initMenu)"
case "$choice" in
    "Config services")
        bash ./rofi/configservice.sh
        ;;
    "Config Wi-Fi")
        bash ./rofi/rofi-wifi-menu.sh
        ;;
    "Change Wallpaper")
        bash ./dwm/wallpaper.sh -r && notify-send "Wallpaper successfully changed."
        ;;
    "Leave dwm")
        leaveDwm
        ;;
esac
