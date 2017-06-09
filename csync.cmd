:: Copy .cmd-files to the Tools Directory

@echo off

echo Updating Tools

%homeDirProjects%
cd %dirCmdTools%
del /f /q *.*
xcopy %dirProjectCmd%\*.cmd %dirCmdTools%\ /EXCLUDE:%dirProjectCmd%\exclude.txt /y >nul 2>nul