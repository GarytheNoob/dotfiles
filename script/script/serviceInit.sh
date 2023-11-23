#!/bin/bash

pgrep -x picom > /dev/null || picom --experimental-backends &
killall v2ray qv2ray
qv2ray &
pgrep -x blueberry-tray >> /dev/null || blueberry-tray 
# clash &
