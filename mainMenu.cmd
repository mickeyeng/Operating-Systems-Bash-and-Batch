rem Hide cmds 
@echo OFF


rem A menu driven shell script written by Michael English(1438760) and Maciej Stanczak(1426262)
color 0a 
rem sets the colour to green

cls
 
title "Menu"
:main
echo "~~~~~~~~~~~~~~~~~~~~~"	
echo " M A I N - M E N U"
echo "~~~~~~~~~~~~~~~~~~~~~"
echo 1 - Show Folder A:
echo 2 - User accounts:
echo 3 - Exit:
echo.
echo Enter choice 1 - 3:


rem user input variable
set /p menuInput= 


if "%menuInput%"=="1" (

	goto one
	
) 



if "%menuInput%"=="2" (

	goto two
)



if "%menuInput%"=="3" (

	goto exitt
) 




:one
cls
start C:\Users\mickey\Desktop\scripts\batch\A rem Open folder A in windows Explorer
call menu2.cmd
rem opens menu2 batch script
goto main


:two
cls
call userAccounts.cmd
goto main


:three
cls
Exit/b  rem exit back to cmd line



:exitt
cls
Exit/b 