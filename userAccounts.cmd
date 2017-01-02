@echo OFF



title "Menu"
:main
echo "~~~~~~~~~~~~~~~~~~~~~"	
echo " USER - M E N U"
echo "~~~~~~~~~~~~~~~~~~~~~"
echo 1 - Add User
echo 2 - Remove User
echo 3 - Add Multiple Users from text file
echo 4 - Remove users from text file
echo 5 - Main Menu
set /p menuInput= 


if "%menuInput%"=="1" (

	goto one
	
) 


if "%menuInput%"=="2" (

	goto two
)

if "%menuInput%"=="3" (

	goto three
)

if "%menuInput%"=="4" (

	goto four
)


if "%menuInput%"=="5" (

	goto five
) else ( rem will go back to main menu if 1 2 3 4 5 are not eneterd
	cls
	goto end
)


echo.
echo Enter choice 1 - 3:


rem user input variable
set /p menuInput= 


:one
cls
rem need to open in administrator mode for this to work

:Username

set /p username=Please Enter a Username:
set /p password=Enter a password:
cls
echo -------------------------------------
echo Username is set to: %username%
echo Password is set to: %password%
echo -------------------------------------


net user %username% /add %password%
if %errorlevel%==0 goto :noerror
goto  error
:noerror
echo %username% has been sucessfully added with the password %password%
pause
goto end
:error
echo error
:end
cls
goto end




:two
cls
net user 
echo.
echo Enter the name of the user you want to delete or press ctrl c to exit:
set /p rmuser=
echo.

net user %rmuser% /del 
if %errorlevel%==0 goto :noerror
goto  error
:noerror
pause
cls
echo %rmuser% has been sucessfully removed
goto end
:error
echo error
:end
pause
net user 
cls
goto end

:three
cls
echo List of files in current directory

echo.
echo.
dir /b
echo.
echo Enter the text file name without the .txt
set /p name=

rem will loop through each word in the file and add it to user add 
FOR /F %%i in (%name%.txt) DO NET USER %%i Password /ADD
pause
cls
echo Sucessfully added users from %name%.txt
cls
echo list of user accounts
net user
pause 
cls
goto end

:four
cls
echo List of files in current directory

echo.
echo.
dir /b
echo.
echo Enter the text file name without the .txt
set /p remove=
rem will loop through each word in the file and remove the user account if exists
FOR /F %%i in (%remove%.txt) DO NET USER %%i /DEL
pause
cls
echo Sucessfully removed users from %remove%.txt
cls
echo list of user accounts
net user
pause
cls
goto end


:five
cls
call mainMenu.cmd

:end
cls
call userAccounts.cmd