::Build Current Project using GruntJS by Default or Apache ANT

@echo off

set criticalFlag=false
set builder=grunt

if "%1"=="-c" (
	set criticalFlag=true
	goto build
) else (
	if "%1"=="-a" (
		set builder=ant
		goto build
	) else (
		goto build
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
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" >nul 2>nul
	cd ..
	goto exit

:exit