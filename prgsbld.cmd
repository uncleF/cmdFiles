::Build Current Good-Seller Template Project using GruntJS by Default or Apache ANT

@echo off

set criticalFlag=false
set template=Base

:option1
	if "%1"=="-c" (
		set criticalFlag=true
		goto option2
	) else (
		if NOT "%1"=="-t" (
			goto build
		) else (
			if NOT "%2"=="" (
				if NOT "%2"=="-c" (
					set template=%2
					goto option3
				) else (
					set criticalFlag=true
					goto build
				)
			) else (
				goto build
			)
		)
	)

:option2
	if NOT "%2"=="-t" (
		goto build
	) else (
		if NOT "%3"=="" (
			set template=%3
			goto build
		) else (
			goto build
		)
	)

:option3
	if "%3"=="-c" (
		set criticalFlag=true
	)
	goto build

:build
	if %criticalFlag%==true (
		grunt build-critical --gruntfile template%template%\gruntfile.js --base .\ --gstemplate=template%template%
	) else (
		grunt build --gruntfile template%template%\gruntfile.js --base .\ --gstemplate=template%template%
	)
	goto exit

:exit