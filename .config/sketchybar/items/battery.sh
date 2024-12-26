#!/usr/bin/env bash

COLOR="0xffffffff"


battery=(
    --add
        item
        battery
        right
    --set
        battery
        update_freq=120
        script="$PLUGIN_DIR/battery.sh"
        font.style="Regular"
    --subscribe battery
        system_woke
        power_source_change
)
sketchybar "${battery[@]}"
