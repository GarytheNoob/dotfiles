#!/bin/bash

# TODO: Switch

if [[ "$THEME" == "onedark" ]]; then
    config_path=~/.config/alacritty/onedark.yml
elif [[ "$THEME" == "lovelive" ]]; then
    config_path=~/.config/alacritty/lovelive.yml
else
    config_path=~/.config/alacritty/alacritty.yml
fi

if [[ "$#" -gt 0 ]]; then
    # TODO: Switch
    if [[ "$1" == "--qalc" ]]; then
        exec alacritty --config-file $config_path --class floating --command qalc
    fi
else
    exec alacritty --config-file $config_path
fi
