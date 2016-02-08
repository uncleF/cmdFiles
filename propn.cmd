:: Open Project

@echo off

set directory=%dirProjects%
set projectName=
set sublime=false

:options
	if [%1]==[] (
		goto open
	)
	if %1==-s (
		set sublime=true
	) else (
		set projectName=%1
		set directory=%dirProjects%\%1
	)
	shift
	goto options

:open
	%homeDirProjects%
	cd %directory%
	if %sublime%==true (
		subl --project %projectName%.sublime-project
	)