:: Commit and Push Project Changes

@echo off

set message="update project"
set remote=origin

:options
	if [%1]==[] (
		goto commit
	)
	if [%1]==[-m] if NOT [%2]==[] if NOT [%2]==[-r] (
		set message=%2
		shift
	)
	if [%1]==[-r] if NOT [%2]==[] if NOT [%2]==[-m] (
		set remote=%2
		shift
	)
	shift
	goto options

:commit
	git add -A
	git commit -a -m %message%
	git pull
	git push %remote%

	endlocal