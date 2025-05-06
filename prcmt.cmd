:: Commit and Push Project Changes

@echo off
setlocal enabledelayedexpansion

set "message=update project"
set "remote=origin"

:options
	if "%~1"=="" goto commit

	if /I "%~1"=="-m" (
    shift
    if "%~2"=="" (
        echo Error: missing commit message after -m
        exit /b 1
    )
    set "message=%~2"
    shift
    goto options
	)

	if /I "%~1"=="-r" (
		shift
		if "%~2"=="" (
				echo Error: missing remote name after -r
				exit /b 1
		)
		set "remote=%~2"
		shift
		goto options
	)

echo Unknown argument: %~1
exit /b 1

goto options

:commit
	git add -A
	git diff --cached --quiet
	if errorlevel 1 (
			git commit -m "!message!"
			if errorlevel 1 (
					echo Commit failed.
					exit /b 1
			)
	) else (
			echo Nothing to commit.
	)
	git pull --rebase
	git push !remote!

endlocal