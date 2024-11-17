#!/bin/bash

# Base path for custom shortcuts in GNOME
BASE_PATH=/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/

# Define your shortcuts in an array
declare -A SHORTCUTS=(
    # Format: ["name"]="command|keybinding"
    ["Open Terminal"]="gnome-terminal|<Super>T"
    ["Open Melee"]="/home/$USER/Files/melee/slippi.AppImage|<Super>M"
    ["Mirror TV Screen"]="/home/$USER/myscript.sh|<Super>S"
    ["Revert Displays"]="/home/$USER/myscript.sh|<Super>S"
)

echo "Creating custom shortcuts..."

# Remove existing custom shortcuts to prevent duplicates
dconf write ${BASE_PATH%/} "[]"

# Add each shortcut
i=0
for NAME in "${!SHORTCUTS[@]}"; do
    COMMAND_KEYBIND="${SHORTCUTS[$NAME]}"
    COMMAND=${COMMAND_KEYBIND%|*}
    KEYBIND=${COMMAND_KEYBIND#*|}
    ENTRY="${BASE_PATH}custom$i/"

    echo "Adding shortcut: $NAME -> $COMMAND ($KEYBIND)"

    # Create the shortcut entry
    dconf write "${ENTRY}name" "'$NAME'"
    dconf write "${ENTRY}command" "'$COMMAND'"
    dconf write "${ENTRY}binding" "'$KEYBIND'"

    ((i++))
done

# Update the list of custom shortcuts
SHORTCUT_PATHS=$(for j in $(seq 0 $((i-1))); do echo -n "'${BASE_PATH}custom$j/', "; done)
dconf write ${BASE_PATH%/} "[${SHORTCUT_PATHS%, }]"
echo "Shortcuts created successfully!"