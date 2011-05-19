:: @echo off
setlocal

call config.bat

set scriptdir=%~dp0

"%scriptdir%curl\curl.exe" %url%/aliases.zip --O "%scriptdir%aliases.zip"

"%scriptdir%7-zip\7za.exe" e -o"%scriptdir%" "%scriptdir%aliases.zip"


del "%scriptdir%aliases.zip"

endlocal