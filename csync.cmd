:: Copy .cmd-files to the Tools Directory

@echo off

echo Updating the Tools

%homeDirProjects%
cd %dirCmdTools%
del /f *.*
xcopy %dirProjectCmd%\*.cmd %dirCmdTools%\ /EXCLUDE:%dirProjectCmd%\exclude.txt /y >nul 2>nul