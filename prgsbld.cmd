@echo off

set criticalFlag="false"
set template="Base"

:option1
	if "%1"=="-c" (
		set criticalFlag="true"
		goto option2
	) else (
		if "%1"=="" (
			goto build
		) else (
			set template=%1
			goto build
		)
	)

:option2
	if "%2"=="" (
		goto build
	) else (
		set template=%1
		goto build
	)

:build
	if %criticalFlag%=="true" (
		grunt build-critical --gruntfile template%template%\gruntfile.js --base .\ --gstemplate=template%template%
	) else (
		grunt build --gruntfile template%template%\gruntfile.js --base .\ --gstemplate=template%template%
	)
	goto exit

:errorOption
	echo Invalid Parameters
	goto exit

:exit