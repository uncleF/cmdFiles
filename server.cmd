:: Start Local HTTP Server and Serve Current Project (/build Directory By Default or Some Other if Specified)

@echo off

set directory=build
set port=8000

:options
	if [%1]==[] (
		goto server
	)
	if [%1]==[-d] if NOT [%2]==[] if NOT [%2]==[-p] (
		set directory=%2
		shift
	)
	if [%1]==[-p] if NOT [%2]==[] if NOT [%2]==[-d] (
		set port=%2
		shift
	)
	shift
	goto options

:server
	if exist %directory% (
		cd %directory%
		start "" "http://localhost:%port%/"
		python -m SimpleHTTPServer %port%
		cd ..
	) else (
		echo "Nothing to Serve / Missing Directory"
	)