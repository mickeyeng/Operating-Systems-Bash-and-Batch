#!/bin/bash
# A sub-menu for main_menu script.


# ----------------------------------
# Step #1: Define variables
# ----------------------------------


RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #1: User defined function
# ----------------------------------

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}



one(){
	# --------------------------------------------------------------------------------------------------------
										#OPEN FILES
	# AS LONG AS THE USER TYPES THE FILE WITH THE EXTENSION, THE FILE SHOULD OPEN WITH THE DEFAULT APPLICATION
	# --------------------------------------------------------------------------------------------------------
	clear
	dirrr="/home/mickey/Documents/bash/A/" # THIS IS NOT THE FINAL PATH 
	echo "Choose a File to open"
	cd "/home/mickey/Documents/bash/A/"
	echo "Please enter the file to open foolowed by the extension" 
	echo ""
	ls
	read openFile

	if [ -f $openFile ]; then   # -d means true if the file exists and is a directory
		echo ""
		echo "That file is there and a directory"
		pause
		xdg-open 2>/dev/null>/dev/null "$openFile" 
		clear
		echo "File has been successfully opened"
		pause
	else
		echo "Not there or not a directory"
		pause
	fi
	

	clear
	 
# User chooses a file to open in gedit / file manager.       
		

}
 
######### as above but with copy/move code
two(){

	# --------------------------------------------------------------------------------------------------------
												#COPY FILES
	# --------------------------------------------------------------------------------------------------------
	dirr="/home/mickey/Documents/bash/B/" # THIS IS NOT THE FINAL PATH 
	dirA="/home/mickey/Documents/bash/A/"
	clear
	echo "Choose a File to Copy/Move to Folder "B""
	echo ""
	cd "$dirA"
	ls

	echo "Please enter the file name:"
	read userInput

	cd "$dirA"
	ls
	clear
	if [ -f $userInput ]; then   # -d means true if the file exists and is a directory
		echo "That file is there and is a directory"  
		pause
		cp  "$userInput" "$dirr"

		ls
		clear
		echo "File has been successfully copied to folder B"
		pause
		clear
		cd "$dirr"
		echo "List of files in folder B"
		ls
		clear
		xdg-open 2>/dev/null>/dev/null "$dirr"  #dev null displays with no debug information
	else
		echo "Not there or not a directory"
	fi

	

    pause
}

three(){
	# --------------------------------------------------------------------------------------------------------
												#RENAME FILES
	# -------------------------------------------------------------------------------------------------------
	dirA="/home/mickey/Documents/bash/A/"
	clear
	echo "Choose a File to Rename"
	pause
	clear
	cd "$dirA"
	echo "Please enter the file name followed by the renamed file"
	ls
	read target


	if mv $source $target # this file name as an argument and renames it
	then
	clear
	echo "Your file has been renamed"
	ls
	xdg-open 2>/dev/null>/dev/null "$dirA"
	else
	 echo "File can not be renamed"
	fi
	
	pause
}

#RENAME multiple files
four() {
	clear
	cd "/home/mickey/Documents/bash/jpg/"
	for file in *.jpg; do
    	mv "$file" "`basename "$file" .jpg`.png"
	done
	ls
	xdg-open 2>/dev/null>/dev/null "/home/mickey/Documents/bash/jpg/"
	cd "/home/mickey/Documents/bash/"
	pause
	echo "File extensions have been sucessfully renamed to png"
	pause

}
 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " FOLDER A - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Open File"
	echo "2. Copy/Move File"
	echo "3. Rename File"
	echo "4. Rename File extensions"
	echo "5. Exit"

}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# invoke the three() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 5] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) four ;;
		5) exit 0;;
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
