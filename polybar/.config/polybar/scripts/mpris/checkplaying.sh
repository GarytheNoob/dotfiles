#!/bin/bash

CUR_PLAYER=$(cat ~/.config/polybar/.curplayer.log)

status=$(playerctl --player=$CUR_PLAYER status 2>/dev/null)
if [ "$status" == "Playing" ]; then
    echo ""
else
    echo ""
fi
