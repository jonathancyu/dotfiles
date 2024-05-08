direction=$1
layer=$2
space=$( yabai -m query --spaces --space | jq -r '.type' )

# TODO :this is gross... 
# Check if keymap[direction][layer] is a string.
# If not, index into keymap[direction][layer][space]
eval $(jq -r \
    --arg direction "$1" \
    --arg layer "$2" \
    --arg space "$space" \
    '
    if (getpath([$direction, $layer]) | type) == "string" then 
        getpath([$direction, $layer])
    else
        getpath([$direction, $layer, $space])
    end
    ' \
    $HOME/.config/skhd/keymap.json)
