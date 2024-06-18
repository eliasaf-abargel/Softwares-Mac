#!/bin/sh

DISK_USAGE=$(df / | grep '/' | awk '{print $5}')

sketchybar --set $NAME label="Disk: $DISK_USAGE"