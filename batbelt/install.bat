@echo off
:: install batbelt to another location and add to path

if not "%1x"=="x" (
	echo installing in %1
	xcopy . "%1\batbelt\" /S
	goto :setpath
) else (
	rem TODO Install in programfiles?
	rem xcopy . "%ProgramFiles(x86)%\batbelt\" /S
	echo please provide installation path
	goto :end
)

:setpath
setx path "%path%;%1\batbelt"
:end