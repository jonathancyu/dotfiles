#!/usr/bin/env bash

opts=(
    --add
        item
        network
        right
    --set
        network
        update_freq=10
        script="$PLUGIN_DIR/network.sh"
        font.style="Regular"
    # --subscribe wifi_change
)
sketchybar "${opts[@]}"
