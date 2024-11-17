#!/bin/bash

# Define monitor names
MONITOR1="DP-3"   # Left/vertical, primary
MONITOR2="DP-1"   # Center, main
MONITOR3="HDMI-0" # TV screen

# Set Monitor 1 to be independent
xrandr --output $MONITOR1 --auto --primary

xrandr --output $MONITOR3 --mode 1920x1080 --same-as $MONITOR2 --rate 60

echo "Display configuration applied: Monitor 2 and 3 mirrored, Monitor 1 independent."