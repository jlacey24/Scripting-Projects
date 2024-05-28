#!/usr/bin/bash

# Set the thresholds for disk usage percentage
LOW=50
MODERATE=75
HIGH=90
EXTREME=97

# Get the disk usage percentage
diskUsage=$(df -h / | grep / | tr -s ' ' | cut -d ' ' -f 5 | cut -d '%' -f 1)

# Check if the usage is above each threshold and print a warning message if it is
if [ "$diskUsage" -gt "$LOW" ]; then
    echo "You still have room to grow! Disk capacity considered LOW" |
    mail -s "Disk usage LOW: $diskUsage%" <emailAddress>

elif [ "$diskUsage" -gt "$MODERATE" ]; then
    echo "Disk is getting full! MODERATE capacity reached" |
    mail -s "Disk usage MODERATE: $diskUsage%" <emailAddress>

elif [ "$diskUsage" -gt "$HIGH" ]; then
    echo "Disk is almost full! High capacity reached" |
    mail -s "Disk usage HIGH: $diskUsage%" <emailAddress>

elif [ "$diskUsage" -gt "$EXTREME" ]; then
    echo "Disk is full! EXTREME capacity reached" |
    mail -s "Disk usage EXTREME: $diskUsage%" <emailAddress>

elif [ "$diskUsage" -lt "$LOW" ]; then
    echo "Disk is doing great! Currently below 50% capacity." |
    mail -s "Disk usage OK: $diskUsage%" <emailAddress>
fi
