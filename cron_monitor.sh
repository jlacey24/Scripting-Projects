#!/usr/bin/bash

# Create a file to store the list of cron jobs
CRON_FILE="/tmp/cron.txt"

# Get the list of cron jobs
crontab -l > $CRON_FILE

# Only stay in the while loop for 55 seconds or until an event is triggered
end=$((SECONDS+55))

while [ $SECONDS -lt $end ]; do

    # Get the updated list of cron jobs
    crontab -l > /tmp/cron2.txt

    # Check if the two files are different
    DIFF=$(diff $CRON_FILE /tmp/cron2.txt)

    # If the files are different, send an email notification
    if [ "$DIFF" != "" ]; then
        echo "A new cron job has been added. Check it out and make sure nothing nefarious has occured." | 
        mail -s "New Cron Job" <emailAddress>
        exit 0
    fi

    # Update the cron file so it's ready for the next update
    cp /tmp/cron2.txt $CRON_FILE

done