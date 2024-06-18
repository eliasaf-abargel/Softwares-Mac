#!/bin/bash

sketchybar --add item network right \
           --set network update_freq=5 \
                         script="$PLUGIN_DIR/network.sh" \
           --subscribe network system_woke