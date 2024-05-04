#!/bin/bash

cache_path=~/.cache/alert_status
/bin/cat $cache_path | grep un && paplay $HOME/Music/notify_sound/notification-tone-swift-gesture.mp3
