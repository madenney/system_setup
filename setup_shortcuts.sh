#!/bin/bash

# Base path for custom shortcuts in GNOME
BASE_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/"

# Define your shortcuts in an array
declare -A SHORTCUTS=(
    # Format: ["name"]="command|keybinding"
    ["Open Terminal"]="gnome-terminal|<Super>T"
    ["Open Email"]="/home/$USER/Tools/thunderbird/thunderbird|<Super>E"
    ["Open Melee"]="/home/$USER/Files/melee/slippi.AppImage|<Super>M"
    ["Mirror TV Screen"]="/home/$USER/Projects/system_setup/activate_mirror.sh|<Super>B"
    ["Revert Displays"]="/home/$USER/Projects/system_setup/revert_displays.sh|<Super>V"
    ["TV Mode"]="/home/$USER/Projects/system_setup/activate_tv_mode.sh|<Super>N"
    ["Toggle Audio Device"]="python3 /home/$USER/Projects/system_setup/switch_audio_device.py|<Super>A"
)

echo "Creating custom shortcuts..."

# Clear existing custom shortcuts to prevent duplicates
dconf write "${BASE_PATH%/}" "@as []"

# Add each shortcut
i=0
for NAME in "${!SHORTCUTS[@]}"; do
    COMMAND_KEYBIND="${SHORTCUTS[$NAME]}"
    COMMAND=${COMMAND_KEYBIND%|*}
    KEYBIND=${COMMAND_KEYBIND#*|}
    ENTRY="${BASE_PATH}custom$i/"

    echo "Adding shortcut: $NAME -> $COMMAND ($KEYBIND)"

    # Write each part of the custom shortcut
    dconf write "${ENTRY}name" "'${NAME}'"
    dconf write "${ENTRY}command" "'${COMMAND}'"
    dconf write "${ENTRY}binding" "'${KEYBIND}'"

    ((i++))
done

# Update the list of custom shortcuts
SHORTCUT_PATHS=$(for j in $(seq 0 $((i-1))); do echo -n "'${BASE_PATH}custom$j/', "; done)
dconf write "${BASE_PATH%/}" "@as [${SHORTCUT_PATHS%, }]"
echo "Shortcuts created successfully!"