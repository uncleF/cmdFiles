:: Build Current Project using GruntJS by Default or Apache ANT

@echo off

set builder=grunt
set criticalFlag=false
set legacy=false
set fast=false

:options
	if [%1]==[] (
		goto build
	)
	if [%1]==[-a] (
		set builder=ant
		set legacy=true
		goto build
	)
	if [%1]==[-c] (
		set criticalFlag=true
	)
	if [%1]==[-l] (
		set legacy=true
	)
	if [%1]==[-f] (
		set fast=true
		goto build
	)
	shift
	goto options

:build
	if %builder%==ant (
		ant -propertyfile %buildProperties%
	) else (
		if %criticalFlag%==true (
			if %fast%==true (
				grunt build-critical-fast %*
			) else (
				grunt build-critical %*
			)
		) else (
			if %fast%==true (
				grunt build-fast %*
			) else (
				grunt build %*
			)
		)
	)
	if %legacy%==true (
		cd build
		for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" >nul 2>nul
		cd ..
	)
	goto exit

:exit