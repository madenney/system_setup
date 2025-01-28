#!/bin/bash

# Debugging
#set -x

# Ensure the correct environment
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Check the current state of Night Light
current_state=$(gsettings get org.gnome.settings-daemon.plugins.color night-light-enabled)

# Toggle the state
if [[ "$current_state" == "true" ]]; then
    echo "Turning Night Light off..."
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled false
else
    echo "Turning Night Light on..."
    # Force Night Light on by disabling the schedule
    gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
    gsettings set org.gnome.settings-daemon.plugins.color night-light-schedule-automatic false
fi
