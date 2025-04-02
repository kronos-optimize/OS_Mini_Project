#!/bin/bash

#prompts user to chose directory path they want
read -p "Enter directory path to search for a file: " dir_path
dir_path=$(eval echo "$dir_path")

#prompts user for file name or extension to search for
read -p "Enter the file name or extension to search for(e.g. *.txt): " file_ext

#check if directory exists
if [ -d "$dir_path" ]; then
	#search for file in directory
	find "$dir_path" -type f -name "$file_ext"
	echo "$(date): Successfully searched for '$file_ext' in '$dir_path'" >> ../script.log
else
	echo "Invalid directory path!"
	echo "$(date): Failed to searched for '$file_ext' in '$dir_path'" >> ../script.log
fi
