:: Update Project Settings

@echo off

set directory=build
set port=8000

:update
	if exist dev (
		copy %dirProjectWeb%\.*rc /y >nul 2>nul
		copy %dirProjectWeb%\.*.yml /y >nul 2>nul
		copy %dirProjectWeb%\.editorconfig /y >nul 2>nul
	) else (
		echo "This is Not a Project Root"
	)