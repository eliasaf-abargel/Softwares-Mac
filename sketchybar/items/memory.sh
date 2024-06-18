#!/bin/bash

sketchybar --add item memory right \
           --set memory update_freq=30 \
                         script="$PLUGIN_DIR/memory.sh" \
           --subscribe memory system_woke