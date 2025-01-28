#!/bin/bash

# Path to the file containing the custom password
PASSWORD_FILE="/home/matt/Projects/system_setup/custom_unlock.txt"

# Read the password from the file
if [ ! -f "$PASSWORD_FILE" ]; then
    echo "Password file not found!" >&2
    exit 1  # Deny login if the file doesn't exist
fi

STORED_PASSWORD=$(cat "$PASSWORD_FILE")

# Read the password entered by the user
read -r ENTERED_PASSWORD

# Compare the stored password with the entered password
if [ "$ENTERED_PASSWORD" == "$STORED_PASSWORD" ]; then
    exit 0  # Allow login
else
    exit 1  # Deny login
fi