#!bin/bash/env python3
import zipfile

# Create a new file and write to it using an input string from the user
with open("test.txt", "w") as testFile:
    txt = input("Enter string to put in file: ")
    testFile.write(txt)
    
# zip file with compression and name it test.zip
with zipfile.ZipFile("test.zip", "w", compression=zipfile.ZIP_DEFLATED) as zipped:
    zipped.write("test.txt")
    print("\nAll zipped up!")