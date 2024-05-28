#!/bin/bash

# Take file name as command line argument
file=$1
# Remove the file path and only copy the file including extension
filename="${file##*/}"
cp $filename backup_$filename