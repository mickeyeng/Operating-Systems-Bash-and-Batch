@echo OFF






title "Menu 2"
:main
cd  C:\Users\mickey\Desktop\scripts\batch

echo "~~~~~~~~~~~~~~~~~~~~~"	
echo " FOLDER A - M E N U"
echo "~~~~~~~~~~~~~~~~~~~~~"
echo 1 - Open File:
echo 2 - Copy/Move File:
echo 3 - Rename File:
echo 4 - Rename multiple file extensions
echo 5 - Remove file:
echo 6 - exit



rem user input variable
set /p menuInput2=


if "%menuInput2%"=="1" (
	goto one
)

if "%menuInput2%"== "2" (

	goto two
)


if "%menuInput2%"== "3" (

	goto three
)

if "%menuInput2%" == "4" (
	goto four
)

if "%menuInput2%" == "5" (
	goto five
)


if "%menuInput2%"=="6" (
	goto six
) else (
	goto end
)


rem Open Files
:one 
cls

echo "choose a File to open from the list below"
echo.
cd "C:\Users\mickey\Desktop\scripts\batch\A" 
rem this will just print files none of the other rubish 
dir /b 
echo.
echo "Please enter the file to open followed by the extension"
echo.
set /p read=

rem if stement that will ask the user to 
rem type the name of the file they want to open then store 
rem the name in the read variable and use the exist cmd to check if the file exists
if exist "%read%" (
	pause
	echo That file is there and is a directory
	start %read%
	dir /b
	cls
	echo "%read%" "has been successfully opened"
	pause
	cls
) else (
	echo "Not there or not a directory"
	cls
	cd C:\Users\mickey\Desktop\scripts\batch
	goto end
	cls
)
cls
goto end







REM COPY/ MOVE FILES 
:two
set myPath=C:\Users\mickey\Desktop\scripts\batch\B
cls
echo "Choose a File to Copy/Move to Folder B"
echo.
cd C:\Users\mickey\Desktop\scripts\batch\A 
dir /b

echo "Please eneter file name:"
echo.
set /p copy=
pause

if exist "%copy%" (
copy "%copy%" "%myPath%"
cls
dir /b
echo.
echo "%copy% has been successfully copied to folder B"
pause
start C:\Users\mickey\Desktop\scripts\batch\B
cls


) else (
	echo "Not there or not a directory"
	cls
	cd C:\Users\mickey\Desktop\scripts\batch
	goto end
	cls
)
cls
cd C:\Users\mickey\Desktop\scripts\batch
goto end


rem RENAME FILE
:three 
cls
pause
echo "Choose a File to Rename"
cls
cd C:\Users\mickey\Desktop\scripts\batch\A 
dir /b
echo.
echo "Please enter the file name"
set /p rename=
echo.
echo "Please enter the new name"
set /p new= 


if exist "%rename%" (
move "%rename%" "%new%"
echo "Your file has been renamed"
cls
dir /b
start C:\Users\mickey\Desktop\scripts\batch\A
pause 
) else (
echo "File can't be renamed"
)
goto end


rem rename multiple extensions
:four
cls
echo "The jpg files in folder jpg will all be changed to an image extension of your choice. Example png"
echo. 
echo Enter the file extension
set /p read=
cd C:\Users\mickey\Desktop\scripts\batch\jpg
dir /b
pause
ren *.jpg *."%read%"
cls
dir /b
pause
cd ..
goto end


rem remove files 
:five
cls 
echo "Choose a file to delete"
cd C:\Users\mickey\Desktop\scripts\batch\A 
echo.
dir /b
echo.
echo "Please enter the file you want to delete"
set /p delete=

if exist "%delete%" (
	del "%delete%"
	cls
	echo %delete% has been sucessfully removed
	cd.
	dir /b
	cd ..
	pause
	goto end
) else (
	echo  %delete% does not exist, please try again

)

cls
cd ..
goto end


rem EXIT
:six
cls
call mainMenu.cmd
goto end

:end
cls
call menu2.cmd
cls
