#!/bin/bash

# Path to the backup file
BACKUP_FILE=gnome_settings_backup.dconf

if [[ -f "$BACKUP_FILE" ]]; then
    echo "Restoring GNOME settings..."
    dconf load / < "$BACKUP_FILE"
    echo "GNOME settings restored successfully!"
else
    echo "Backup file not found at $BACKUP_FILE. Unable to restore settings."
fi
