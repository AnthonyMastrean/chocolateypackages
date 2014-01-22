@ECHO OFF

IF '%1'=='' (SET architecture=x86) ELSE (SET architecture=%1)

:: The intermediate files and final ISO will be created at the
:: drive root where this script is located.
SET dir=%~d0

SET destination=%dir%\winpe_%architecture%
SET destination_iso=%destination%\iso
SET destination_src=%destination_iso%\sources
SET etfsboot=%destination%\etfsboot.com
SET winpewim=%destination%\winpe.wim
SET bootwim=%destination_src%\boot.wim

SET tools=%PROGRAMFILES%\Windows AIK\Tools
SET pesetenv=%tools%\PETools\pesetenv.cmd
SET imagex=%tools%\%architecture%\imagex.exe

SET final_iso=%dir%\winpe_%architecture%.iso

:: Set environment variables to point to all the necessary tools.
CALL "%pesetenv%"

:: Create the directory structure and copy all the necessary files
:: for that architecture. The previous cmd drops you in the PE 
:: tools directory, so you can call the copype.cmd directly.
CALL copype.cmd %architecture% "%destination%"

:: Provide the ImageX tool in the Preinstallation Environment 
:: (http://goo.gl/jgmAu)
COPY "%imagex%" "%destination_iso%"

:: Don't forget the boot WIM (http://goo.gl/FtQvU)
COPY "%winpewim%" "%bootwim%"

:: Create a Windows PE image (.iso) file.
oscdimg -n -b"%etfsboot%" "%destination_iso%" "%final_iso%"

IF %ERRORLEVEL% NEQ 0 PAUSE