@echo off

set compass="false"

if exist dev (
	goto compassOption
) else (
	goto errorDirectory
)

:compassOption
	if "%1"=="-c" (
		set compass="true"	
		goto sass
	) else (
		if "%1"=="" (
			goto sass
		) else (
			goto errorOption
		)
	)

:sass
	if %compass%=="true" (
		sass --compass --sourcemap --style expanded --watch dev/res/sass-dev:dev/res/css-dev
	) else (
		sass --sourcemap --style expanded --watch dev/res/sass-dev:dev/res/css-dev
	)
	goto exit

:errorDirectory
	echo Nothing To Watch
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:exit