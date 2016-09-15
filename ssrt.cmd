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
	set folder2x=%$folder%@2x
	set folder3x=%$folder%@3x
	md %folder%
	md %folder2x%
	md %folder3x%
	move *@3x.png %folder3x%\
	move *@3x.jpg %folder3x%\
	move *@2x.png %folder2x%\
	move *@2x.jpg %folder2x%\
	move *.png %folder%\
	move *.jpg %folder%\
	move *.svg %folder%\
	xcopy %folder3x% %folder3x% /S
	xcopy %folder2x% %folder2x% /S
	xcopy %folder% %folder% /S
