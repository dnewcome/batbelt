:: deploy a single alias to the server
call config.bat
if "%1x"=="x" goto :end

pscp %1.bat %toolpath%/alias

:end
echo usage: deploy-alias ^<name^>