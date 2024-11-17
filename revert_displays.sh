#!/bin/bash

# Define monitor names
MONITOR1="DP-3"   # Left/vertical, primary
MONITOR2="DP-1"   # Center, main
MONITOR3="HDMI-0" # TV screen

# Set up Monitor 1 (primary display)
# xrandr --output $MONITOR1 --auto --primary --pos 1080x1920+0+137

# # Set up Monitor 2
# xrandr --output $MONITOR2 --auto --pos 1920x1080+1080+489 

# # Set up Monitor 3
# xrandr --output $MONITOR3 --auto --pos 3840x2160+3000+0


xrandr --output HDMI-0 --mode 3840x2160 --rate 120 --pos 3000x0 --rotate normal
xrandr --output DP-1 --mode 1920x1080 --pos 1080x421 --rotate normal
xrandr --output DP-3 --primary --mode 1920x1080 --pos 0x73 --rotate right

echo "Display configuration reverted to three independent monitors."