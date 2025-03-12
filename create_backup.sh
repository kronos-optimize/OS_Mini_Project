#!/bin/bash

# Create a backup of files or directories
echo "Enter the file/directory path to back up: "
read source

echo "Enter the backup path: "
read destination

# Check if source exists
if [ -e "$source" ]; then
    # Check if destination is a directory and writable
    if [ -d "$destination" ] && [ -w "$destination" ]; then
        cp -r "$source" "$destination"
        echo "'$source' backed up successfully to '$destination'."

        # Check if the cp command was successful
        if [ $? -eq 0 ]; then  # Success
            # Log the action
            echo "Successfully backed up '$source' to '$destination' on $(date)" >> script.log
        else  # Failure
            echo "Failed to back up '$source' to '$destination' on $(date)" >> script.log
        fi
    else
        echo "Invalid or non-writable destination: '$destination'"
        echo "Failed to back up '$source' to '$destination' on $(date)" >> script.log
    fi
else
    echo "'$source' does not exist!"
    echo "Failed to back up '$source' to '$destination' on $(date)" >> script.log
fi
