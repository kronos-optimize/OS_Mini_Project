#!/bin/bash

# List all files or sub-directories in a directory

# Prompt user for a directory to list
read -p "Enter the directory path to list files: " dir_path

# Check if directory exists
if [ -d "$dir_path" ]; then
    echo "Listing files and sub-directories in '$dir_path':"
    ls -l "$dir_path"  # Lists all files with detailed info
    
    # Check if the ls command was successful
    if [ $? -eq 0 ]; then
        # Log action on success
        echo "Listed files in directory '$dir_path' on $(date)" >> script.log
    else
        # Log action on failure
        echo "Failed to list files in '$dir_path' on $(date)" >> script.log
    fi
else
    # Invalid directory
    echo "Invalid directory path!"
    echo "Failed to list files in '$dir_path' on $(date)" >> script.log
fi
