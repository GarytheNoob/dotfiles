#!/bin/bash

manageService(){
    menu="dunst\nfcitx5\npicom" # REMOVED sxhkd to avoid danger
    echo -e "$menu" | rofi -dmenu -p "Manage services"
}

switchProgram(){ # switchProgram [PROGRAM_NAME]
    if [ $1 == 'picom' ]; then
        if [ -n "$(pgrep -x picom)" ]; then
            killall picom && notify-send "Killed picom"
        else
            notify-send "Started picom" && exec picom --experimental-backends -b
        fi
    elif [ -n "$(pgrep -x $1)" ]; then
        killall $1 && notify-send "Killed $1"
    else
        $1 & notify-send "Started $1"
    fi
}

selectedService="$(manageService)"
if [ -n "$selectedService" ]; then
    switchProgram "$selectedService"
fi
