#!/bin/bash

# Define monitor names
MONITOR1="DP-3"   # Left/vertical
MONITOR2="DP-1"   # Center
MONITOR3="HDMI-0" # TV screen (to be the only active screen)

# Turn off Monitor 1
xrandr --output $MONITOR1 --off

# Turn off Monitor 2
xrandr --output $MONITOR2 --off

# Set Monitor 3 as the only active screen with 1920x1080 resolution
xrandr --output $MONITOR3 --mode 1920x1080 --primary

echo "Display configuration applied: Only Monitor 3 is active with 1920x1080 resolution."
