#!/usr/bin/bash

# mydir is the directory path
# newname is what the files will be changed to
mydir=$1
newname=$2
num=1

for file in "$mydir"/*
do
	# Rename the files by "moving" them to the same folder, adding
	# and incrementing a number to the end of the filename 
	mv $file $mydir/$newname$num
	num=$[ $num + 1 ]
done