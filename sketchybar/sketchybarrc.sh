#!/bin/bash

# Source the color definitions
source "$CONFIG_DIR/colors.sh"

# Define the plugin directory
PLUGIN_DIR="$CONFIG_DIR/plugins"
ITEM_DIR="$CONFIG_DIR/items"
##### Bar Appearance Configuration #####
sketchybar --bar height=37 \
           blur_radius=30 \
           position=top \
           sticky=off \
           padding_left=10 \
           padding_right=10 \
           color=$BAR_COLOR

##### Default Item Properties #####
sketchybar --default icon.font="SF Pro:Semibold:15.0" \
                     icon.color=$WHITE \
                     label.font="SF Pro:Semibold:15.0" \
                     label.color=$WHITE \
                     background.color=$ITEM_BG_COLOR \
                     background.corner_radius=5 \
                     background.height=24 \
                     padding_left=5 \
                     padding_right=5 \
                     label.padding_left=4 \
                     label.padding_right=10 \
                     icon.padding_left=10 \
                     icon.padding_right=4

##### Adding Items #####

# Space indicators (customize as needed)
source $ITEM_DIR/spaces.sh
# Front app indicator
source $ITEM_DIR/front_app.sh
# Calendar
source $ITEM_DIR/calendar.sh
# Volume
source $ITEM_DIR/volume.sh
# Keyboard
#source $ITEM_DIR/keyboard_layout.sh
# Media
source $ITEM_DIR/media.sh
# Battery indicator
source $ITEM_DIR/battery.sh
# CPU
source $ITEM_DIR/cpu.sh
# Network activity
#source $ITEM_DIR/network.sh
# Memory usage
#source $ITEM_DIR/memory.sh
# Disk usage
#source $ITEM_DIR/disk.sh
##### Update all scripts initially #####
sketchybar --update

