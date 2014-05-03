@echo off

set shareFlag="false"
set builder="grunt"

:option1
	if "%1"=="-s" (
		set shareFlag="true"
		goto option2
	) else (
		if "%1"=="-a" (
			set builder="ant"
			goto option2
		) else (
			if "%1"=="" (
				goto build
			) else (
				goto errorOption
			)
		)
	)

:option2

	if "%2"=="-s" (
		set shareFlag="true"
		goto build
	) else (
		if "%2"=="-a" (
			set builder="ant"
			goto build
		) else (
			if "%2"=="" (
				goto build
			) else (
				goto errorOption
			)
		)
	)

:build
	if %builder%=="ant" (
		if %shareFlag%=="true" (
			ant -propertyfile %buildProperties% -Dbuild.share=share
		) else (
			ant -propertyfile %buildProperties%
		)
	) else (
		if %shareFlag%=="true" (
			grunt build-share
		) else (
			grunt build
		)
	)
	cd build
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:exit