#!/bin/bash

# FILENAME: monitor.sh
# DESCRIPTION: a shell script to manage and set monitors using rofi

listMonitor(){
    # Get the connected Monitors and display a rofi menu for users to choose
    # Returning a single monitor name like "HDMI-0"

    connectedMonitors="$(xrandr -q | grep -w "connected" | awk '{print $1}')"
    echo -e "$connectedMonitors" | rofi -dmenu -p "Choose a monitor"
}

monitorSetRelative(){
    # monitorSetRelative [MON_TO_CONF] [RELATIVE] [RELATIVE_MON]
    # e.g.: monitorSetRelative HDMI-0 left eDP-0 ==> hdmi-0 will be on the left of edp-0
    # options of [RELATIVE]: up down left right same

    monitor=$1
    rel=$2
    rel_mon=$3
    case "$rel" in
        "up")
            xrandr --output $monitor --above $rel_mon
            ;;
        "down")
            xrandr --output $monitor --below $rel_mon
            ;;
        "left")
            xrandr --output $monitor --left-of $rel_mon
            ;;
        "right")
            xrandr --output $monitor --right-of $rel_mon
            ;;
        "same")
            xrandr --output $monitor --same-as $rel_mon
            ;;
    esac

}

monitorCmd(){
    # monitorCmd [MONITOR] [CMD]

    monitor=$1
    cmd=$2
    case "$cmd" in
        "auto")
            xrandr --output $monitor --auto
            ;;
        "rotateNormal")
            xrandr --output $monitor --rotate normal
            ;;
        "rotateRight")
            xrandr --output $monitor --rotate right
            ;;
        "rotateLeft")
            xrandr --output $monitor --rotate left
            ;;
        "rotateInverted")
            xrandr --output $monitor --rotate inverted
            ;;
        "off")
            xrandr --output $monitor --off
            ;;
    esac
}

listMonitor
