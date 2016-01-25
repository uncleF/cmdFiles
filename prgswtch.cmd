:: Watch Current Good-Seller Template Project with GruntJS watch-project Task

@echo off

set template=Base

if NOT "%1"=="" (
	set template=%1
)

:watch
	if exist template%template%\dev (
		grunt watch-project --gruntfile template%template%\gruntfile.js --base .\ --gstemplate=template%template%
	) else (
		goto errorDirectory
	)
	goto exit

:errorDirectory
	echo Nothing To Watch
	goto exit

:exit