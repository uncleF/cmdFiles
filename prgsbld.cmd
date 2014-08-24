@echo off

set criticalFlag="false"
set template="Base"

:option1
	if "%1"=="-c" (
		set criticalFlag="true"
		goto option2
	) else (
		if "%1"!="-c" (
			set template=%1
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

	if "%2"=="-c" (
		set criticalFlag="true"
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
		ant -propertyfile %buildProperties%
	) else (
		if %criticalFlag%=="true" (
			grunt build-critical
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