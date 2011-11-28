:: deploy a new optional tool out to the webserver
:: usage: deploy-tool <local-path> <name>
@echo off
if "%1x"=="x" goto end

call config.bat
7-zip\7za.exe a -r "%2".zip ".\%1\*"
pscp "%2".zip %toolpath%
goto :eof
:end
echo usage: deploy-tool ^<local-path^> ^<name^>