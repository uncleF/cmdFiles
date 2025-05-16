:: Copy .cmd-files to the Tools Directory

@echo off

echo Updating Tools

set "currentDrive=%cd:~0,2%"
set "currentDirectory=%cd%"
%homeDirProjects%
cd %dirCmdTools%
xcopy %dirProjectCmd%\*.cmd %dirCmdTools%\ /EXCLUDE:%dirProjectCmd%\exclude.txt /y >nul 2>nul
%currentDrive%
cd %currentDirectory%
