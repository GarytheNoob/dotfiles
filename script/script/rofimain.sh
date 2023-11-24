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
    if [ -n "$(pgrep dwm)" ]; then
        menu="Config services\nConfig Wi-Fi\nChange Wallpaper\nSet Monitor\nLeave dwm" 
    else
        menu="Config services\nConfig Wi-Fi\nChange Wallpaper\nSet Monitor"
    fi
    echo -e "$menu" | exec rofi -dmenu -p "Choose function"
}

# main

choice="$(initMenu)"
case "$choice" in
    "Config services")
        bash $HOME/script/configservice.sh
        ;;
    "Config Wi-Fi")
        bash $HOME/script/rofi-wifi-menu.sh
        ;;
    "Change Wallpaper")
        bash $HOME/script/wallpaper.sh -r && notify-send "Wallpaper successfully changed."
        ;;
    "Leave dwm")
        leaveDwm
        ;;
esac
