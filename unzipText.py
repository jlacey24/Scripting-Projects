#!bin/bash/env python3
import zipfile

# Take input from the user to open a file
fileName = input('Type file name you want to unzip: ')

# Read the zipped file and extract all the contents contained within
with zipfile.ZipFile(fileName, "r") as zipped:
    extracted = zipped.extractall()
    
# Open the unzipped file and print the contents to the screen    
with open("test.txt") as unzipped:
    contents = unzipped.read()
    print("\n" + contents + "\n")