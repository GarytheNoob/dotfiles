#!/bin/bash

connected_displays=$(xrandr -q | grep " connected" | awk '{print $1}')
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
    printf "$hdmi_display\n$edp_display\n"
fi
