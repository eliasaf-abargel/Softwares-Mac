#!/bin/bash

# Add or update the keyboard layout item configuration
sketchybar --add item keyboard_layout right \
           --set keyboard_layout script="$PLUGIN_DIR/keyboard_layout.sh" \
           --subscribe keyboard_layout system_woke key_down key_up