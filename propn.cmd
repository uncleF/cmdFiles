:: Open Project

@echo off

set directory=%dirProjects%
set project=
set sublime=false
set new=false

:options
	if [%1]==[] (
		goto open
	)
	if [%1]==[-s] (
		set sublime=true
	) 
	if [%1]==[-n] (
		set new=true
	)
	if NOT [%1]==[] if NOT [%1]==[-s] if NOT [%1]==[-n] (
		set project=%1
		set directory=%dirProjects%\%1
	)
	shift
	goto options

:open
	%homeDirProjects%
	cd %directory%
	if %sublime%==true (
		if %new%==true (
			subl --project %project%.sublime-project -n
		) else (
			subl --project %project%.sublime-project -a
		)
	)