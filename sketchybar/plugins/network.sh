#!/bin/sh

DOWNLOAD=$(netstat -bn | grep -Eo 'en0.+[0-9]+' | awk '{print $7}' | sort -nr | head -n1)
UPLOAD=$(netstat -bn | grep -Eo 'en0.+[0-9]+' | awk '{print $10}' | sort -nr | head -n1)

if [ "$DOWNLOAD" -gt 1000000 ] || [ "$UPLOAD" -gt 1000000 ]; then
  ICON="􀙚"
else
  ICON="􀈊"
fi

sketchybar --set $NAME icon="$ICON" label="↓$(($DOWNLOAD/1000))kB ↑$(($UPLOAD/1000))kB"