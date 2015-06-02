@echo off

if "%1"=="" (
	goto errorName
) else (
	goto projectSetup
)

:projectSetup
	echo Setting Up Good-Seller Template Project %1
	%homeDirProjects%
	cd %dirProjects%GoodSellerTemplates
	md template%1
	cd template%1
	md dev
	xcopy %dirProjects%GoodSellerTemplates\templateBase\dev dev /s /q /y
	xcopy %dirProjects%GoodSellerTemplates\templateBase\gruntfile.js /q /y
	xcopy %dirProjects%GoodSellerTemplates\templateBase\GStemplate.sublime-project .\GStemplate%1.sublime-project /q /y
	md meta
	md design
	md sources
	del /s /f /q .DS_Store
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	replaceText gruntfile.js GoodSellerTemplates GoodSellerTemplate%1
	replaceText GStemplate%1.sublime-project GoodSellerTemplates GoodSellerTemplate%1
	cd ..
	goto exit

:errorName
	echo Please Enter Template Number
	goto exit

:exit