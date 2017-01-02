#!/bin/bash
# A sub-menu for Accounts script.

RED='\033[0;41;30m'
STD='\033[0;0;39m'


pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

# ADD A SINGLE USER
one() {
	clear
	awk -F: '/\/home/ {printf "%s:%s\n",$1,$3}' /etc/passwd # list user accounts
	echo "please enter the name of the user" 
	read user

	if id -u "$user" &>/dev/null 2>&1; then
	echo "user exists"
	else
	sudo useradd "$user"
	sudo passwd "$user"
	echo "${user} has been successfully added"
	fi

}



# REMOVE A SINGLE USER
two() {
	clear
	awk -F: '/\/home/ {printf "%s:%s\n",$1,$3}' /etc/passwd # list user accounts

	echo "please enter the name of the user" 
	read user

	if id -u "$user" &>/dev/null 2>&1; then
	sudo userdel -r "$user"
	pause
	echo "${user} has been successfuly removed from the system" 
	else
	echo "${user} does not exist"
	fi

} 


# ADD USERS FROM FILE
three() {
	clear 
	ls
	echo ""
	echo "please enter the name of the text file"
	read user
	ls 
	clear
	echo "This will add all users from the users text file"
	pause	
	while IFS=: read username
	do
		sudo useradd -m $username
	done < users.txt

	clear 
	pause
	read -p "Sucessfully added users"
	clear
	
	awk -F: '/\/home/ {printf "%s:%s\n",$1,$3}' /etc/passwd # list user accounts
}



# REMOVE USERS FROM FILE
four() {
	clear
	echo "This will remove all accounts created from the user.txt file"
	pause

	while IFS=: read username  # IFS is like a word seperator
	do
		sudo userdel -f $username
	done < users.txt


	clear
	echo "Sucessfully removed users"
	echo "list of users"
	pause
	awk -F: '/\/home/ {printf "%s:%s\n",$1,$3}' /etc/passwd # list user accounts

}


show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " USER - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Add user"
	echo "2. Remove user"
	echo "3. Add multiple users from text file"
	echo "4. Remove users from text file"
	echo "5. Exit"
}




read_options(){
	local choice
	read -p "Enter choice [ 1 - 4] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) four;;
		5) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}


while true
do
	show_menus
	read_options
done
clear