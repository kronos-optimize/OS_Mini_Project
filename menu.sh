#!/bin/bash

echo "Mini Project: File and Directory Management Program"
echo "1. List files or sub-directories."
echo "2. Create backup of file or directory."
echo "3. Count the number of files."
echo "4. Display disk usage of directory."
echo "5. Search for filename or extension in directory."
echo "6. Compress file or directory."
echo "0. Exit..."

read -p "Choose an option: " option

case $option in
1) ./list_files.sh ;;
2) ./create_backup.sh ;;
3) ./count_files.sh ;;
4) ./disk_usage.sh ;;
5) ./search_file.sh ;;
6) ./compress.sh ;;
0) exit ;;
*) echo "Invalid option!" ;;
esac

