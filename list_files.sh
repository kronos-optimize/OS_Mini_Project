#!/bin/bash

# List all files or sub-directories in a directory

# Prompt user for a directory to list
read -p "Enter the directory path to list files: " dir_path

# Expand tilde (~) to home directory
dir_path=$(eval echo "$dir_path")

# Check if directory exists
if [ -d "$dir_path" ]; then
    echo "Listing files and sub-directories in '$dir_path':"

    # Check if directory is empty
    if [ -z "$(ls -A "$dir_path")" ]; then
        echo "The directory '$dir_path' is empty."
        echo "$(date): The directory '$dir_path' is empty." >> script.log
    else
        ls -l "$dir_path"  # Lists all files with detailed info

        # Check if the ls command was successful
        if [ $? -eq 0 ]; then
            # Log action on success
            echo "$(date): Listed files in directory '$dir_path'." >> script.log
        else
            # Log action on failure
            echo "$(date): Failed to list files in '$dir_path'." >> script.log
        fi
    fi
else
    # Invalid directory
    echo "Invalid directory path!"
    echo "$(date): Failed to list files in '$dir_path'" >> script.log
fi
