:: Update Project Settings

@echo off

set project=%dirProjectWeb%

:options
	if %1==-a (
		set project=%dirProjectApp%
	)
	if %1==-m (
		set project=%dirProjectMail%
	)
	goto update

:update
	if exist dev (
		copy %project%\.*rc /y >nul 2>nul
		copy %project%\.*.yml /y >nul 2>nul
		copy %project%\.editorconfig /y >nul 2>nul
	) else (
		echo "This is Not a Project Root"
	)