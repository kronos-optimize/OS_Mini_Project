#!/bin/bash

#prompts user for file or directory to compress
read -p "Enter the full path of the file or directory to compress: " source_path

#prompts user for zip file name
read -p "Enter the name of for the compressed file (e.g. backup.zip): " zip_name

#check if the source is a file or directory and compress it
if [ -f "$source_path" ]; then
	#if file, create zip
	zip "$zip_name" "$source_path"
	echo "File '$source_path' compressed into '$zip_name'."
	echo "$(date): Successfully compressed file '$source_path' into '$zip_name'." >> ../script.log
elif [ -d "$source_path" ]; then
	#if directory, create zip
	zip -r "$zip_name" "$source_path"
	echo "Directory '$source_path' compressed into '$zip_name'."
	echo "$(date): Successfully compressed directory '$source_path' into '$zip_name'." >> ../script.log
else
	echo "Invalid file or directory."
	echo "Failed to compress file/directory." >> ../script.log
fi
