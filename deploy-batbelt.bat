:: create batbelt distribution and deploy to web server
:: this is just the basic tool distribution, no optional
:: tools are included.
call config.bat

batbelt\7-zip\7za.exe a -r -sfx batbelt.exe batbelt
pscp batbelt.exe %toolpath%
pscp -r alias\ %aliaspath%