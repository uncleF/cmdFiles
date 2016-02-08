:: Open Project

@echo off

set directory=%dirProjects%
set project=
set sublime=false

:options
	if [%1]==[] (
		goto open
	)
	if [%1]==[-s] (
		set sublime=true
	) else (
		set project=%1
		set directory=%dirProjects%\%1
	)
	shift
	goto options

:open
	%homeDirProjects%
	cd %directory%
	if %sublime%==true (
		subl --project %project%.sublime-project
	)