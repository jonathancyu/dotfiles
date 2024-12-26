#!/opt/homebrew/bin/bash
sketchybar --add event aerospace_workspace_change

# Workspace Icons Map
declare -A WORKSPACE_ICONS=(
    # [1]="󰎤"  # Work 1
    # [2]="󰈹"  # Work 2
    # [3]="󰨞"  # Work 3
    ["C"]="󰭹"  # Chat
    ["P"]=""  # Personal
    # [5]="󱇧"  # Media
    # [6]="󰏆"  # Files
    # [7]="󰊗"  # Settings
    # [8]="󰖲"  # Games
    # [9]="󰕧"  # Misc
)

for sid in $(aerospace list-workspaces --all); do
    icon="${WORKSPACE_ICONS[$sid]:-$sid}"  # Fallback to sid if no icon defined
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
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
