#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini

# connected_displays=$(xrandr | grep -w "connected" | awk '{print $1}')
connected_displays=$(xrandr | awk '/ connected/ {print $1}')

hdmi_display=$(echo "$connected_displays" | grep "HDMI")
edp_display=$(echo  "$connected_displays" | grep "eDP")

if [ -n "$hdmi_display" ] && [ -n "$edp_display" ]; then
    if [[ "$#" -gt 0 && "$1" == "--sing" ]]; then
        MONITOR="$hdmi_display" polybar mainbar 2>&1 | tee -a /tmp/polybar/mainbar.log & disown
    else
        MONITOR="$hdmi_display" polybar mainbar  2>&1 | tee -a /tmp/polybar/mainbar.log & disown
        MONITOR="$edp_display"  polybar minorbar 2>&1 | tee -a /tmp/polybar/minorbar.log & disown
    fi
else
    MONITOR="$edp_display"  polybar mainbar  2>&1 | tee -a /tmp/polybar/mainbar.log & disown
fi
