:: Watch Current Project with GruntJS watch-project Task

@echo off

if exist dev (
	grunt watch-project
	goto exit
) else (
	goto errorDirectory
)

:errorDirectory
	echo Nothing To Watch
	goto exit

:exit
