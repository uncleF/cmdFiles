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
echo Sorting Sprites
call usptcopy Phone@3x %folder%
call usptcopy Phone@2x %folder%
call usptcopy Phone %folder%
call usptcopy @3x %folder%
call usptcopy @2x %folder%
for %%f in (*@1x.*) do (
	set filename=%%f
	set extention=%%~xf
	ren %filename% %filename:~0,-7%%extention%
)
md %folder% >nul 2>nul
move *.png %folder%\ >nul 2>nul
move *.jpg %folder%\ >nul 2>nul
move *.svg %folder%\ >nul 2>nul
xcopy %folder% %folder% /S /y >nul 2>nul
