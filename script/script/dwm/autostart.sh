#!/bin/sh

cd "/home/$(whoami)"
./script/dwm/xrandrInit.sh
./script/dwm/serviceInit.sh
./script/dwm/wallpaper.sh -r

