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

# Add new shortcuts
i=0
success_count=0
attempt_count=0
for NAME in "${!SHORTCUTS[@]}"; do
    COMMAND_KEYBIND="${SHORTCUTS[$NAME]}"
    COMMAND=${COMMAND_KEYBIND%|*}
    KEYBIND=${COMMAND_KEYBIND#*|}
    ENTRY="${BASE_PATH}custom$i/"

    echo "================================================================"
    echo "Shortcut: $NAME"

    # Remove any existing shortcut with the same name or keybinding
    EXISTING_SHORTCUTS=$(dconf read "${BASE_PATH%/}" | tr -d '[],' | tr -d "'")
    for SHORTCUT_PATH in ${EXISTING_SHORTCUTS}; do
        SHORTCUT_NAME=$(dconf read "${SHORTCUT_PATH}name" | tr -d "'")
        SHORTCUT_BINDING=$(dconf read "${SHORTCUT_PATH}binding" | tr -d "'")
        if [[ "$SHORTCUT_NAME" == "$NAME" || "$SHORTCUT_BINDING" == "$KEYBIND" ]]; then
            echo "Removing existing shortcut: $SHORTCUT_NAME ($SHORTCUT_BINDING)"
            dconf reset -f "$SHORTCUT_PATH"
        fi
    done

    # Add the new shortcut
    echo "Adding new shortcut: $NAME"
    echo "keybind -> $KEYBIND"
    echo "command -> $COMMAND"

    dconf write "${ENTRY}name" "'${NAME}'" && \
    dconf write "${ENTRY}command" "'${COMMAND}'" && \
    dconf write "${ENTRY}binding" "'${KEYBIND}'"

    if [[ $? -eq 0 ]]; then
        echo "Success."
        ((success_count++))
    fi
    ((attempt_count++))
    ((i++))
done

# Update the list of custom shortcuts
SHORTCUT_PATHS=$(for j in $(seq 0 $((i-1))); do echo -n "'${BASE_PATH}custom$j/', "; done)
dconf write "${BASE_PATH%/}" "@as [${SHORTCUT_PATHS%, }]"

# Final summary
echo "================================================================"
echo "================================================================"
echo "Total: $success_count/$attempt_count"
