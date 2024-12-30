#!/usr/bin/env bash

is_fullscreen=$(aerospace list-windows --focused --json \
    | jq '.[] | select(."window-is-fullscreen" == true) | length >= 1')

if [ "$is_fullscreen" = "true" ]; then
    sketchybar --set aerospace_fullscreen label=󰘖
else
    sketchybar --set aerospace_fullscreen label=""
fi
