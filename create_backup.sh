#!/bin/bash

# Create a backup of files or directories
read -p "Enter the file/directory path to back up: " source
read -p "Enter the backup path: " destination

# Expand the tilde (~) to the full path
source=$(eval echo "$source")
destination=$(eval echo "$destination")

# Check if source exists
if [ -e "$source" ]; then
    # Check if destination is a directory and writable
    if [ -d "$destination" ] && [ -w "$destination" ]; then
        # Check if source is a file or directory and handle appropriately
        if [ -d "$source" ]; then
            # If source is a directory, use cp -r
            cp -r "$source" "$destination"
        else
            # If source is a file, just copy it
            cp "$source" "$destination"
        fi

        echo "'$source' backed up successfully to '$destination'."

        # Check if the cp command was successful
        if [ $? -eq 0 ]; then  # Success
            # Log the action
            echo "$(date): Successfully backed up '$source' to '$destination'." >> script.log
        else  # Failure
            echo "$(date): Failed to back up '$source' to '$destination'." >> script.log
        fi
    else
        echo "Invalid or non-writable destination: '$destination'"
        echo "$(date): Failed to back up '$source' to '$destination'." >> script.log
    fi
else
    echo "'$source' does not exist!"
    echo "$(date): Failed to back up '$source' to '$destination'." >> script.log
fi
