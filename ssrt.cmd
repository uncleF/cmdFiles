:: Sort Sprites into Corresponding Folders

@echo off

set directory=sprites

:options
	if [%1]==[] (
		goto sorting
	) else {
		set directory=%1
	}
	shift
	goto options

:sorting
echo Sorting Sprites
call usptcopy Phone@3x %directory%
call usptcopy Phone@2x %directory%
call usptcopy Phone %directory%
call usptcopy @3x %directory%
call usptcopy @2x %directory%
for %%f in (*@1x.*) do (
	set filename=%%f
	set extention=%%~xf
	ren %filename% %filename:~0,-7%%extention%
)
md %directory% >nul 2>nul
move *.png %directory%\ >nul 2>nul
move *.jpg %directory%\ >nul 2>nul
move *.svg %directory%\ >nul 2>nul
xcopy %directory% %directory% /S /y >nul 2>nul
