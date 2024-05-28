#!bin/bash/env python3
import json

# Open tweets.json and read each line into the variable jsonData
with open('tweets.json', 'r') as jsonFile:
    jsonData = jsonFile.readlines()
    
# Create an empty dictionary and load each object (line) into a dictionary
zoneDict = {}
for obj in jsonData:
    tweetDictionary = json.loads(obj)
    
    # Location of the timezones value
    zoneDict1 = tweetDictionary['user']['time_zone']
       
    # Count the number of unique timezones
    if (zoneDict1 in zoneDict.keys() ):
        zoneDict[zoneDict1] += 1
    else:
        zoneDict[zoneDict1] = 1

# Loop through dictionary and print the timezones and how often they occur
for timezone, occur in zoneDict.items():
    print(str(timezone) + " - " + str(occur))