#!/bin/bash

connected_displays=$(xrandr | grep -w "connected" | awk '{print $1}')
hdmi_display=""
edp_display=""

for display in $connected_displays; do
    if xrandr --query | grep -w "$display" | grep -q "eDP"; then
        edp_display="$display"
    elif xrandr --query | grep -w "$display" | grep -q "HDMI"; then
        hdmi_display="$display"
    fi
done

if [ -n "$hdmi_display" ] && [ -n "$edp_display" ]; then
    xrandr --output "$hdmi_display" --auto --mode 2560x1440 --rate 144
    xrandr --output "$edp_display" --auto --left-of "$hdmi_display" --rotate right
else
    xrandr --output eDP-1-2 --auto
fi
