@ECHO OFF

D:
IF NOT "%1"=="" (
	cd %dirProjects%\%1
) ELSE (
	cd %dirProjects%
)