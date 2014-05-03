@echo off

%homeDirProjects%
IF NOT "%1"=="" (
	cd %dirProjects%\%1
) ELSE (
	cd %dirProjects%
)