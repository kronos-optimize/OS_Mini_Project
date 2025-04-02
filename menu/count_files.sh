#!/bin/bash

# Count the number of files in a directory of a given directory

# Prompt the user for a directory
echo "Please enter directory path: "
read dir

# Expand the tilde to the full path if necessary
dir=$(eval echo "$dir")

# Check if the directory exists
if [ -d "$dir" ]; then
    count=$(find "$dir" -type f | wc -l)
    echo "Counting number of files in '$dir': $count"
    echo "$(date): Counted files in '$dir': $count files." >> ../script.log
else
    echo "Invalid directory."
    echo "$(date): Failed to count files in '$dir'." >> ../script.log
fi
