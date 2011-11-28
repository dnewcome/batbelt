:: create batbelt distribution and deploy to web server
:: this is just the basic tool distribution, no optional
:: tools are included.
call batbelt\config.bat

:: use -sfx to make self-extracting. Some firewalls block
:: exe files so this is not as useful as I thought.
:: batbelt\7-zip\7za.exe a -r -sfx batbelt.exe batbelt
batbelt\7-zip\7za.exe a -r batbelt.zip batbelt

:: pscp batbelt.exe %toolpath%
batbelt\pscp\pscp batbelt.zip %toolpath%
