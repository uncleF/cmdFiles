:: Open Project

@echo off
setlocal

set directory=%dirPersonal%
set project=
set sublime=false
set new=false

:options
	if [%1]==[] (
		goto open
	)
	if [%1]==[-s] (
		set sublime=true
	) else (
		set project=%1
		set directory=%dirPersonal%\%1
	)
	shift
	goto options

:open
	%homeDirProjects%
	cd %directory%
	if %sublime%==true (
		call sbl
	)

endlocal