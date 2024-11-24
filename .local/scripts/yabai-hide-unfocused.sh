# Get the id of the currently focused window
focused_window=$(yabai -m query --windows --window | jq '.id')

# Get the current space/desktop ID
current_space=$(yabai -m query --spaces --space | jq '.index')

# Get all window ids on the current space
all_windows=$(yabai -m query --windows --space $current_space | jq '.[].id')

# Loop through all windows on current space and minimize those that aren't focused
for window in $all_windows; do
    if [ "$window" != "$focused_window" ]; then
        yabai -m window $window --minimize
    fi
done
