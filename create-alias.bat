:: Create script to run tools and download from remote repository 
::	if they don't exist locally
::	2010 Dan Newcome

:: usage:
:: create-alias <shortcut-name> <package-path> <executable-name>

:: <package-path> is relative to the location of the batbelt root
@echo off
if "%1x"=="x" goto :end

echo @echo off > alias\%1.bat
echo call weblaunch.bat %2 %3 %%* >> alias\%1.bat

goto :eof
:end
echo usage: create-alias ^<name^> ^<package-path^> ^<executable-name^>
