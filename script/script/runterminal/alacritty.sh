#!/bin/bash

if [[ "$THEME" == "onedark" ]]; then
    exec alacritty --config-file ~/.config/alacritty/onedark.yml
elif [[ "$THEME" == "lovelive" ]]; then
    exec alacritty --config-file ~/.config/alacritty/lovelive.yml
else
    exec alacritty
fi
