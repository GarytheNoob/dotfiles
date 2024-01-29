#!/bin/bash

pgrep -x picom > /dev/null || picom --experimental-backends -b

# if [ -z "$(pgrep -x qv2ray)" ]; then
#     qv2ray &
# fi
pgrep -x blueberry-tray >> /dev/null || blueberry-tray 
# clash &
