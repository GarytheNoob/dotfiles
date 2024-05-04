#!/bin/bash

cache_path=~/.cache/alert_status

if [ ! -f "$cache_path" ]; then 
    echo "unmuted" > $cache_path
fi

status=$(/bin/cat $cache_path)

if [[ $# -gt 0 && $1 == "-q" ]]; then
    case "$status" in
        "muted")
            echo "󰂛"
            ;;
        "unmuted")
            echo "󰂚"
            ;;
    esac
else
    case "$status" in
        "muted")
            echo "unmuted" > $cache_path
            ;;
        "unmuted")
            echo "muted" > $cache_path
            ;;
    esac
fi


