#!/bin/bash

# Get current keyboard layout identifier
LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | awk -F'\"' '/"KeyboardLayout Name"/{print $(NF-1)}')

# Determine icon based on the layout identifier
case $LAYOUT in
    "Hebrew")
        ICON="🇮🇱" # Icon for Hebrew
        LABEL="hb"  # Short label for Hebrew
        ;;
    "U.S.")
        ICON="🇺🇸" # Icon for English
        LABEL="eu"  # Short label for English
        ;;
    *)
        ICON="❓"
        LABEL="??"
        ;;
esac

# Update SketchyBar item to show only the icon
sketchybar --set $NAME icon="$ICON" label=""