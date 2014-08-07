@echo off

if exist dev (
	goto watch
) else (
	goto errorDirectory
)

:watch
	grunt watch-project
	goto exit

:errorDirectory
	echo Nothing To Watch
	goto exit

:exit