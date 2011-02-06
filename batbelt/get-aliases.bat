@echo off
setlocal

call config.bat

set scriptdir=%~dp0

%scriptdir%curl\curl.exe %url%/aliases.zip --O aliases.zip
%scriptdir%7-zip\7za.exe e -o%~dp0 aliases.zip
del aliases.zip

endlocal