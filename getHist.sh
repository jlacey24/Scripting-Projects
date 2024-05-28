#!/bin/bash

# Enable history command in noninteractive shell
# Set the HISTFILE variable
HISTFILE=~/.bash_history
set -o history
cat ~/.bash_history