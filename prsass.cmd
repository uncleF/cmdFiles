:: Watch Current Project with Sass

@echo off

set compass=false

:options
	if [%1]==[-c] (
		set compass=true
	)
	goto sass

:sass
	if exist dev (
		if %compass%==true (
			sass --compass --sourcemap --style expanded --watch dev/res/sass-dev:dev/res/css-dev
		) else (
			sass --sourcemap --style expanded --watch dev/res/sass-dev:dev/res/css-dev
		)
		goto exit
	) else (
		goto errorDirectory
	)

:errorDirectory
	echo Nothing To Watch
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:exit
