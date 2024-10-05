#!/bin/bash

# cd "/home/$(whoami)"
# ./script/dwm/xrandrInit.sh
# ./script/dwm/serviceInit.sh
# ./script/dwm/wallpaper.sh -r

# $HOME/script/xrandrInit.sh
$HOME/script/serviceInit.sh
export PATH="/var/lib/snapd/snap/bin:$PATH"
$HOME/script/wallpaper.sh -r
