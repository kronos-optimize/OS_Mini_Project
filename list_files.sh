#!/bin/bash

# List all files or sub-directories in a directory

# Prompt user for a directory to list
read -p "Enter the directory path to list files: " dir_path

# Check if directory exists
if [ -d "$dir_path" ]; then
    echo "Listing files and sub-directories in '$dir_path':"
    ls -l "$dir_path"  # Lists all files with detailed info
else
    echo "Invalid directory path!"
fi

# Log action
echo "Listed files in directory '$dir_path' on $(date)" >> script.log

