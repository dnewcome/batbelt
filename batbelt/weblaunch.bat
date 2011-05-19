:: Script to run tools and download from remote repository 
::	if they don't exist locally
::	2010 Dan Newcome

:: Usage:
::	weblaunch <appname> <executable>

:: Notes: 
::	archive name (zip file) must match the application name. Appname and 
::	executable must not contain spaces.
::
:: TODO: enable flag for whether to 'call' or 'start' (spawn new window or not)
::		commandline tools currently will start in their own shell windows, which
::		probably will get annoying.
::
:: TODO: enable force re-get from server. If package is updated. This may be
:: 	lower priority though.

@echo off
setlocal

call config.bat

:: handle arguments - shift off to consume first two args to weblaunch since
:: we don't want to pass them to the target executable via %*
set appname_tmp=%1
for /f "tokens=1 delims=\" %%a in ("%appname_tmp%") do set appname=%%a
set executable=%2
set apppath=%~dp0%appname_tmp%
set scriptdir=%~dp0
shift && shift

set path=%path%;%apppath%

:: TODO: shift doesn't affect %*, so we resort to naming each param 
:: there must be some better way to do this
if exist "%apppath%" (
	start %executable% %1 %2 %3 %4 %5 %6 %7 %8 %9
) else (
	echo %appname% not installed - fetching
	"%scriptdir%"curl\curl.exe %url%/%appname%.zip --O "%scriptdir%%appname%.zip"
	"%scriptdir%"7-zip\7za.exe x -o"%scriptdir%%appname%" "%scriptdir%%appname%.zip"
	del "%scriptdir%%appname%.zip"
	start %executable% %1 %2 %3 %4 %5 %6 %7 %8 %9
)
endlocal