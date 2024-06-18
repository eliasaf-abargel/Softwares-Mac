#!/bin/bash

sketchybar --add item disk right \
           --set disk update_freq=300 \
                         script="$PLUGIN_DIR/disk.sh" \
           --subscribe disk system_woke
