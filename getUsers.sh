#!/bin/bash

# Store usernames in variable and echo out the results 
usernames=$(compgen -u)
echo -e "$usernames\n"