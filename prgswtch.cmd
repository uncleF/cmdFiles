@echo off

set template="Base"

:option1
	if "%1"=="" (
		goto check
	) else (
		set template=%1
		goto check
	)

:check
	if exist template%template%\dev (
		goto watch
	) else (
		goto errorDirectory
	)

:watch
	grunt watch-project --gruntfile template%template%\gruntfile.js --base .\ --gstemplate=template%template%
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:errorDirectory
	echo Nothing To Watch
	goto exit

:exit