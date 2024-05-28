#!/bin/bash

# Enable history command in noninteractive shell
# Set the HISTFILE variable
HISTFILE=~/.bash_history
set -o history
# Get only the unique commands
count=$(cat ~/.bash_history | uniq -dD | wc -l)
echo "The number of unique bash commands: $count"