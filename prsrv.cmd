:: Start Local HTTP Server and Serve Current Project

@echo off

set task=dev

:options
	if [%1]==[] (
		goto server
	)
	if [%1]==[-b] (
		set task=build
	)
	shift
	goto options

:server
	grunt connect:%task%

:exit