@echo on
:: add current path to the system path
:: Note that ~dp0 yields trailing slash which is treated
:: as an esacape character. trailing semicolon fixes this.
setx path "%path%;%~dp0;"
