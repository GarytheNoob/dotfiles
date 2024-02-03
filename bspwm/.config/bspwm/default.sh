#!/bin/sh

export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export LC_CTYPE=en_US.UTF-8

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export SXHKD_SHELL=/usr/bin/bash

export THEME=onedark

fcitx5 &
dunst &

$HOME/script/autostart.sh


xrdb -merge $HOME/.Xresources

xsetroot -cursor_name left_ptr

pgrep -x sxhkd > /dev/null || sxhkd &

bspc config window_gap          8
bspc config border_width         2
bspc config focused_border_color "#61afef"
bspc config normal_border_color "#abb2bf"
bspc config split_ratio          0.5
bspc config borderless_monocle   false
bspc config gapless_monocle      false

# RULES
# workspace
bspc rule -a firefox desktop='^2'
bspc rule -a linuxqq desktop='^3'
bspc rule -a QQ desktop='^3'
bspc rule -a TelegramDesktop desktop='^3'
bspc rule -a discord desktop='^3'

bspc rule -a Screenkey manage=off

# state
bspc rule -a feh state=floating center=true
bspc rule -a blueberry.py state=floating center=true
bspc rule -a imv state=floating center=true
bspc rule -a SimpleScreenRecorder state=floating
bspc rule -a guvcview state=floating rectangle=480x270+1440+810 sticky=on layer=above
bspc rule -a Zathura state=tiled
bspc rule -a "QQ:qq:图片查看器" state=floating
# bspc rule -a vlc state=floating center=true
# bspc rule -a mpv state=floating
bspc rule -a "*:floating:*" state=floating center=true

