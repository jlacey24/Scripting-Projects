#!/usr/bin/bash

# Set the CPU thresholds
LOW=1.0
MODERATE=1.5
HIGH=2.0
EXTREME=3.0

# Get the current CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Check each threshold and send the threshold category and actual CPU usage
# via email to jonnylacey24@gmail.com
if (( $(echo "$CPU > $EXTREME" | bc -l) )); then
echo "CPU usage for $HOSTNAME is at $CPU, exceeding the threshold of $EXTREME" | 
mail -s "System is under EXTREME load" <emailAddress>

elif (( $(echo "$CPU > $HIGH" | bc -l) )); then
echo "CPU usage for $HOSTNAME is at $CPU, exceeding the threshold of $HIGH" |
mail -s "System is under HIGH load" <emailAddress>

elif (( $(echo "$CPU > $MODERATE" | bc -l) )); then
echo "CPU usage for $HOSTNAME is at $CPU, exceeding the threshold of $MODERATE" |
mail -s "System is under MODERATE load" <emailAddress>

elif (( $(echo "$CPU > $LOW" | bc -l) )); then
echo "CPU usage for $HOSTNAME is at $CPU, exceeding the threshold of $LOW" |
mail -s "System is under LOW load" <emailAddress>

fi
