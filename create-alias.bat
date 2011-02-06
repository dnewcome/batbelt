:: Creat script to run tools and download from remote repository 
::	if they don't exist locally
::	2010 Dan Newcome

:: usage:
:: create-script <shortcut-name> <package-path> <executable-name>

:: <package-path> is relative to the location of the batbelt root

echo @echo off > alias\%1.bat
echo call weblaunch.bat %2 %3 %%* >> alias\%1.bat