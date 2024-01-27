#!/bin/bash

connected_displays=$(xrandr | awk '/ connected/ {print $1}')

hdmi_display=$(echo "$connected_displays" | grep "HDMI")
edp_display=$(echo  "$connected_displays" | grep "eDP")

if [ -n "$hdmi_display" ] && [ -n "$edp_display" ]; then
    xrandr --output "$hdmi_display" --auto --mode 2560x1440 --rate 144
    xrandr --output "$edp_display" --auto --left-of "$hdmi_display" --rotate right
else
    xrandr --output "$edp_display" --auto
fi
