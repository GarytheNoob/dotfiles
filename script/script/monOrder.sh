#!/bin/bash

# connected_displays=$(xrandr | grep -w "connected" | awk '{print $1}')
connected_displays=$(xrandr | awk '/ connected/ {print $1}')

hdmi_display=$(echo "$connected_displays" | grep "HDMI")
edp_display=$(echo  "$connected_displays" | grep "eDP")

if [ -n "$hdmi_display" ] && [ -n "$edp_display" ]; then
    bspc wm -O "$hdmi_display" "$edp_display"
    notify-send "Monitor order set successfully"
fi
