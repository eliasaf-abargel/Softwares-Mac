#!/bin/sh

USED_MEMORY=$(top -l 1 | awk '/PhysMem/ {print $2}')

sketchybar --set $NAME label="MEM: $USED_MEMORY"