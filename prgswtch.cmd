@echo off

set template="Base"

:option1
	if "%1" (
		set tempalte=%1
	)

if exist template%tempalte\dev (
	goto watch
) else (
	goto errorDirectory
)

:watch
	grunt watch-project --gruntfile template%template\gruntfile.js --base .\ --gstemplate=template%template
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:errorDirectory
	echo Nothing To Watch
	goto exit

:exit