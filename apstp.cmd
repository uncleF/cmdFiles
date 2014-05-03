@echo off

if "%1"=="" (
	goto errorName
) else (
	goto projectSetup
)

:projectSetup
	echo Setting Up Project %1
	%homeDirProjects%
	cd %dirProjects%
	md %1
	cd %1
	md dev
	xcopy %dirProjectsApp%\dev dev /s /q /y
	xcopy %dirProjectsApp%\gruntfile.js /q /y
	xcopy %dirProjectsApp%\csscombConfig.json /q /y
	xcopy %dirProjectsApp%\package.json /q /y
	md meta
	md design
	md sources
	del /s /f /q .DS_Store
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	replaceText gruntfile.js AppX %1
	if "%2"=="" (
		replaceText gruntfile.js appx %1
	) else (
		replaceText gruntfile.js appx %2
	)
	goto npmQuestion

:npmQuestion
	set npm=
	set /p npm="Do You Want to Install npm Dependencies (y/n)? "
	if %npm%==y (
		goto npmInstall
	) else (
		if %npm%==n (
			goto exit
		) else (
			goto errorAnswer
		)
	)

:npmInstall
	npm install
	goto exit

:errorName
	echo Please Enter Project Name
	goto exit

:errorAnswer
	echo Please Answer (y)es or (n)o
	goto npmQuestion

:exit