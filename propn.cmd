::Open Project

@echo off

%homeDirProjects%
if NOT "%1"=="" (
	if "%1"=="-s" (
		if NOT "%2"=="" (
			cd %dirProjects%\%2
			subl --project %2.sublime-project
		) else (
			cd %dirProjects%
		)
	) else (
		cd %dirProjects%\%1
		if "%2"=="-s" (
			subl --project %1.sublime-project
		)
	)
) else (
	cd %dirProjects%
)