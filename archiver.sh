#!/usr/bin/bash

# Get the user selected directory and store the current date in a variable
# to be used to name the zip file.
mydir=$1
currentdate="$(date +"%m-%d-%y")"

# Search selected directory for files that have not been modified in over a week
# and zip them into 1 zip file with the name of the current date
# zip -j to remove the path and only zip the files
find $mydir -maxdepth 1 -type f -mtime +7 -exec zip -j $currentdate.zip {} \;
