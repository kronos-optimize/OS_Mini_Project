#!/bin/bash

#Prompts user for directory path
read -p "Enter the directory path to check disk usage: " dir_path

dir_path=$(eval echo "$dir_path")

#checks if directory exists
if [ -d "$dir_path" ]; then
	#displays disk usage
	du -sh "$dir_path"
	echo "$(date): Successfully checked disk usage for '$dir_path'." >> script.log
else
	echo "Invalid directory path!"
	echo "$(date): Failed to check disk usage for '$dir_path'." >> script.log
fi
