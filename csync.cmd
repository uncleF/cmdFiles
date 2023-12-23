:: Copy .cmd-files to the Tools Directory

@echo off

echo Updating Tools

set "currentDirectory=%cd%"
%homeDirProjects%
cd %dirCmdTools%
xcopy %dirProjectCmd%\*.cmd %dirCmdTools%\ /EXCLUDE:%dirProjectCmd%\exclude.txt /y >nul 2>nul
cd %currentDirectory%
