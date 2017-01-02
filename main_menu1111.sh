#!/bin/bash
# A menu driven shell script written by Michael English(1438760) and Maciej Stanczak(1426262)


# ----------------------------------
# Step #1: Define variables
# ----------------------------------

# ----------------------------------
			# colours
RED='\033[0;41;30m'
STD='\033[0;0;39m'
# ----------------------------------

.includes ./scripts/menu_1.sh
.includes ./scripts/menu_2.sh
.includes ./scripts/info.sh


# ----------------------------------
# Step #1: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey

}

one(){
	open /home/mickey/Documents/bash/A/
	echo "Folder "A" opened"
	clear
	bash ./menu_1.sh
# Opens folder "A" in file manager to display contents        
		
	pause
}
 
# do something in two()
two(){
	bash ./accountsMenu.sh
	pause
}



 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Show Folder "A""
	echo "2. User accounts"
	echo "3. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 5 ] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_menus
	read_options
done
clear
