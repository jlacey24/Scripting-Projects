#!/usr/bin/bash

# Define ALL functions for the menu selector
function os_info(){
	echo ""
	echo -e "OS Info results:\n"
	uname -a
}
function host_name(){
	echo ""
	hname=$(hostname)
	echo "The hostname is $hname"
}
function net_info(){
	echo ""
	netstat
}
function ip_address(){
	echo ""
	ip=$(hostname -I)
	echo "Your IP address is $ip"
}
function logged_in(){
	echo ""
	echo "Logged in users are:"
	who
}
function disk_usage(){
	echo ""
	df
}
function process_list(){
	echo ""
	echo -e "The current processes are:\n"
	ps
}

menu(){
echo -ne "
------------------
      Menu
------------------
1. OS Info
2. Hostname
3. Network info
4. IP Address only
5. Users logged in
6. Disk Usage
7. Process list
8. Exit 

Enter your choice [ 1 - 8 ] "
	read choice
	case $choice in
		1) os_info ; menu;;
		2) host_name ; menu;;
		3) net_info ; menu;;
		4) ip_address ; menu;;
		5) logged_in ; menu;;
        6) disk_usage ; menu;;
		7) process_list ; menu;;
	8) exit 0 ;;
	esac
}
# Call the menu function
menu