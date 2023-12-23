:: Sprites Copying Utility

@echo off
setlocal

if exist *%1.* (
	md %2%1
	move *%1.png %2%1 >nul 2>nul
	move *%1.jpg %2%1 >nul 2>nul
)

endlocal