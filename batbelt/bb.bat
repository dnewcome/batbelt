@echo off
if "%1x"=="x" goto :usage

set command=%1
shift
call commands\%command% %1 %2 %3 %4 %5 %6 %7 %8 %9 
goto :end

:usage
echo.
echo Batbelt copyright 2010 Dan Newcome
echo provided under the MIT license
echo.
echo edit config.bat to point to Batbelt repository
echo `bb get-aliases' to retrieve available command shortcuts
echo `bb create-alias' to create a new alias to a tool
echo `bb deploy-alias' to send a new alias to the depot
echo `bb deploy-tool' to create zip package and send a to the depot
echo `bb install' to install permanently and set path

:end
