@echo off

set criticalFlag=false
set builder=grunt

if "%1"=="-c" (
	set criticalFlag=true
) else (
	if "%1"=="-a" (
		set builder=ant
	) else (
		goto errorOption
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