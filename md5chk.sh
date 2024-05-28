#!/bin/bash

# Get the directory path from command line argument
dirpath=$1

for file in "$dirpath"/*
do

	# Create md5 hash of all files and remove file name
	hash=($(md5sum "${file##*/}"))

	# Create file name by removing the file path
	filename="${file##*/}"

	# Echo the hash and file name into a temporary file
	echo $hash $filename >> tmp.txt

done

echo -e "Files that contain same hashes:\n"
# Extract the files with the same hash values by taking the first 32 characters
# of the file and using the flag dD to get duplicate files
finddup=$(sort tmp.txt | uniq -w 32 -dD >> dup.txt)

# Cut the hash and only output the file name
cut -c 34- dup.txt

# Remove temporary files
rm tmp.txt
rm dup.txt