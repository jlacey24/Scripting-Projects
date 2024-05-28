#!/usr/bin/bash

# Welcome message
echo -e ""
echo -e "\e[1;31;4mWelcome to Jonny's script that gets a bunch of System info stuff!\e[0m\n"

# Get kernel version
echo -e "\e[92m1:\e[0m"
echo -e "\e[1mKernel version:\e[0m $(uname -r)\n"

# Get total number of user accounts on the system
echo -e "\e[92m2:\e[0m"
echo -e "\e[1mTotal number of user accounts:\e[0m $(cat /etc/passwd | wc -l)\n"

# Get a list of user accounts with usernames only
echo -e "\e[92m3:\e[0m"
echo -e "\e[1mList of user accounts:\e[0m"
echo -e "$(cut -d: -f1 /etc/passwd)\n"

# Get the total number of commands the root user has run
echo -e "\e[92m4:\e[0m"
echo -e "\e[1mTotal number of commands run by root:\e[0m $(cat /root/.bash_history | wc -l)\n"

# Get a de-duplicated list of users that have logged in
echo -e "\e[92m5:\e[0m"
echo -e "\e[1mList of users who have logged in:\e[0m"
echo -e "$(last | cut -d " " -f 1 | sort -r | uniq)\n"

# Get a list of any txt files on the system (filenames ending in ".txt")
echo -e "\e[92m6:\e[0m"
echo -e "\e[1mList of .txt files:\e[0m"
echo -e "$(find / -type f -name "*.txt")\n"

# Get a list of any files in the /etc/ directory containing the word "readme" that's case insensitive
echo -e "\e[92m7:\e[0m"
echo -e "\e[1mList of files in /etc/ directory containing 'readme':\e[0m"
echo -e "$(find /etc/ -type f -iname "*readme*")\n"

# Get the type of CPU in use on the machine
echo -e "\e[92m8:\e[0m"
echo -e "\e[1mCPU type:\e[0m $(cat /proc/cpuinfo | grep 'model name' | cut -d ':' -f 2- | uniq)\n"

# Get a list of devices in /dev/ which begin with letters "sd..."
echo -e "\e[92m9:\e[0m"
echo -e "\e[1mList of devices in /dev/ beginning with 'sd':\e[0m"
echo -e "$(find /dev/ -name 'sd*')\n"

# Get the main network adapter's MAC address
echo -e "\e[92m10:\e[0m"
echo -e "\e[1mMAC address of main network adapter:\e[0m $(ip a | grep link/ether | cut -d ' ' -f 6)\n"