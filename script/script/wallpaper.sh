#!/bin/bash

pathfile=$HOME/.wallpaper.path
wallpaperdir=$HOME/wallpapers/*

refreshWallpaper(){ 
    # Get the path of a random wallpaper in the directory
    # Then store it in the file
    current="$(cat $pathfile)"
    selected="$current"

    # Keep retrying until a different picture is chosen
    while [ "$selected" == "$current" ]; do
        selected="$(shuf -e -n1 $wallpaperdir)"
    done

    echo "$selected" > $pathfile
}

setWallpaper(){
    # Read the path from the file and set wallpaper
    cat $pathfile | xargs feh --bg-fill
}

# only reselect if "-r" sign is given
if [ "$1" == "-r" ]; then
    refreshWallpaper
fi

setWallpaper
