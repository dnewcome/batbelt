:: deploy a new optional tool out to the webserver
:: usage: deploytool <local-path> <name>
call config.bat
batbelt\7-zip\7za.exe a -r "%2".zip ".\%1\*"
pscp "%2".zip %toolpath%
