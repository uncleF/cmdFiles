:: Sort Sprites into Corresponding Folders

@echo off

set folder=sprites

:options
	if [%1]==[] (
		goto sorting
	) else {
		set folder=%1
	}
	shift
	goto options

:sorting
	set folder2x=%folder%@2x
	set folder3x=%folder%@3x
	md %folder%
	md %folder2x%
	md %folder3x%
	move *@3x.png %folder3x%\ >nul 2>nul
	move *@3x.jpg %folder3x%\ >nul 2>nul
	move *@2x.png %folder2x%\ >nul 2>nul
	move *@2x.jpg %folder2x%\ >nul 2>nul
	move *.png %folder%\ >nul 2>nul
	move *.jpg %folder%\ >nul 2>nul
	move *.svg %folder%\ >nul 2>nul
	xcopy %folder3x% %folder3x% /S /y >nul 2>nul
	xcopy %folder2x% %folder2x% /S /y >nul 2>nul
	xcopy %folder% %folder% /S /y >nul 2>nul
