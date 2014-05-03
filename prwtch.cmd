@echo off

set livereload="false"

if exist dev (
	goto livereloadOption
) else (
	goto errorDirectory
)

:livereloadOption
	if "%1"=="-l" (
		set livereload="true"	
		goto watch
	) else (
		if "%1"=="" (
			goto watch
		) else (
			goto errorOption
		)
	)

:watch
	if %livereload%=="true" (
		grunt concurrent:projectWatchReload
	) else (
		grunt concurrent:projectWatch
	)
	goto exit

:errorDirectory
	echo Nothing To Watch
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:exit