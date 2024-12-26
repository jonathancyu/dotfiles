#!/usr/bin/env bash

COLOR="0xffffffff"

clock=(
    --add
        item
        clock
        right
    --set
        clock
        update_freq=1
        icon="󰃰"
        script=$PLUGIN_DIR/clock.sh
)
sketchybar "${clock[@]}"
