#!/usr/bin/bash

# Take filename as command line argument and assign default password
namefile=$1
unames=$(cat "$namefile")
pass="Password1!"

# Check to see if the filename exists then prompt for sudo password
if [ -e $namefile ];
	sudo -k echo -e "Creating user accounts for:\n"
then
	for name in $unames
	do
        # Loop through the usernames and use -m to create home directories
        # for each and set the password
		echo "--> $name"
		sudo useradd -m $name
		echo $name:$pass | sudo chpasswd
	done
	echo -e "\nUser accounts created!"
fi