:: @echo off
setlocal

call config.bat

set scriptdir=%~dp0

"%scriptdir%wget\wget.exe" %url%/alias/ --recursive --no-directories --level=1 --accept .bat


endlocal