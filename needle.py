#!bin/bash/env python3
import json
import argparse
import sys
import zipfile

# Create a parser with description, program name, and epilog
parser = argparse.ArgumentParser(description='Script to parse json data',
                                 prog=sys.argv[0],
                                 epilog='python3 needle.py -f companies.json.zip')
parser.add_argument("-f", "--file",  help="After -f, type companies.json.zip")
args = parser.parse_args()

# Take in file from command line argument
fileName = sys.argv[2]

# Read the zipped file and extract all the contents contained within
with zipfile.ZipFile(fileName, "r") as zipped:
    extracted = zipped.extractall()

# Read the unzipped file
with open('companies.json') as compFile:
    data = compFile.readlines()

# Iterate through each line of the data, extracting the name, founed_year, and funding_rounds
for i in (data):
    data = json.loads(i)
    myDictionary1 = data['name']
    myDictionary2 = data['founded_year']
    myDictionary3List = data['funding_rounds']

    # Iterate through the list of funding rounds and extract the raised amount
    for amount in myDictionary3List:
        amount1 = amount['raised_amount']

    print(myDictionary1, "-", myDictionary2, "-", amount1)