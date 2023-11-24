#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini

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
    MONITOR="$hdmi_display" polybar mainbar 2>&1 | tee -a /tmp/polybar.log & disown
    MONITOR="$edp_display"  polybar minorbar 2>&1 | tee -a /tmp/polybar.log & disown

else
    MONITOR="$edp_display" polybar mainbar 2>&1 | tee -a /tmp/polybar.log & disown
fi
echo "Polybar launched..."
