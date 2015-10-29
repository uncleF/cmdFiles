::Setup Good-Seller Template Project

@echo off

set template=

if "%1"=="" (
	goto errorName
) else (
	template=%1
	goto projectSetup
)

:projectSetup
	echo Setting Up Good-Seller Template Project %template%
	call propn
	cd GoodSellerTemplates
	md template%template%
	cd template%template%
	md dev
	xcopy %dirProjects%\GoodSellerTemplates\templateBase\dev .\dev /s /q /y >nul 2>nul
	copy %dirProjects%\GoodSellerTemplates\templateBase\gruntfile.js /q /y >nul 2>nul
	copy %dirProjects%\GoodSellerTemplates\templateBase\GStemplate.sublime-project .\GStemplate%template%.sublime-project /q /y >nul 2>nul
	md design
	md sources
	md meta
	del .DS_Store /s /f /q >nul 2>nul
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" >nul 2>nul
	cd ..
	replaceText gruntfile.js GoodSellerTemplates GoodSellerTemplate%template%
	replaceText GStemplate%template%.sublime-project GoodSellerTemplates GoodSellerTemplate%template%
	cd ..
	goto exit

:errorName
	echo Please Enter Template Number
	goto exit

:exit