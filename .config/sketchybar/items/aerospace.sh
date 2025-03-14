# TODO: make this portable
#!/opt/homebrew/bin/bash
sketchybar --add event aerospace_workspace_change

# Workspace Icons Map
declare -A WORKSPACE_ICONS=(
    # [1]="󰎤"  # Work 1
    # [2]="󰈹"  # Work 2
    # [3]="󰨞"  # Work 3
    ["C"]="󰭹"  # Chat
    ["P"]=""  # Personal
    ["S"]="󰋋"  # Music / Spotify
    # [5]="󱇧"  # Media
    # [6]="󰏆"  # Files
    # [7]="󰊗"  # Settings
    # [8]="󰖲"  # Games
    # [9]="󰕧"  # Misc
)


for m in $(aerospace list-monitors | awk '{print $1}'); do
    for sid in $(aerospace list-workspaces --monitor $m); do
        icon="${WORKSPACE_ICONS[$sid]:-$sid}"  # Fallback to sid if no icon defined
        sketchybar --add space space.$sid left \
            --subscribe space.$sid aerospace_workspace_change \
            --set space.$sid space="$sid"\
            display=$m \
            background.color=0x44ffffff \
            background.corner_radius=5 \
            background.height=20 \
            background.drawing=off \
            label.position=center\
            label.padding_left=0\
            icon.padding_right=0\
            label="$icon" \
            click_script="aerospace workspace $sid" \
            script="$CONFIG_DIR/plugins/aerospace.sh $sid"
    done
done
# Fullscreen icon on the left
sketchybar --add event aerospace_fullscreen_change
sketchybar --add item aerospace_fullscreen left \
    --subscribe aerospace_fullscreen aerospace_workspace_change aerospace_fullscreen_change \
    --set aerospace_fullscreen \
    background.color=0x44ffffff \
    background.corner_radius=5 \
    background.height=20 \
    background.drawing=off \
    label.position=center\
    label.padding_left=20\
    icon.padding_right=0\
    label="" \
    click_script="aerospace fullscreen" \
    script="$CONFIG_DIR/plugins/aerospace_fullscreen.sh"


