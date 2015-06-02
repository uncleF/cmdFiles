@echo off

set projectName=
set packageName=
set remoteFlag=false

if "%1"=="" (
	goto errorName
) else (
	if "%1"=="-r" (
		set remoteFlag=true
		if NOT "%2"=="" (
			set projectName=%2
			set packageName=%3
			goto projectSetup			
		) else (
			goto errorName
		)
	) else (
		set projectName=%1
		if "%2"=="-r" (
			set remoteFlag=true
		) else (
			set packageName=%2
			if "%3"=="-r" (
				set remoteFlag=true
			)
		)
		goto projectSetup
	)
)

:projectSetup
	echo Setting Up App Project %projectName%
	%homeDirProjects%
	cd %dirProjects%
	if "%remoteFlag%"=="false" (
		md %projectName%
		cd %projectName%
		md dev
		md meta
		md design
		md sources
		xcopy %dirProjectsApp%dev dev /s /q /y
		copy %dirProjectsApp%gruntfile.js /y
		copy %dirProjectsApp%package.json /y
		copy %dirProjectsApp%backstop.json /y
		copy %dirProjectsWeb%.*.yml /y
		copy %dirProjectsApp%.*rc /y
		copy %dirProjectsApp%.editorconfig /y
		copy %dirProjectsApp%AppX.sublime-project .\%projectName%.sublime-project /q /y
	) else (
		git clone %remoteProjectApp% %projectName%
		cd %projectName%
		del /s /f /q *.md
		rd .git /s /q
		ren TemplateX.sublime-project %projectName%.sublime-project
	)
	del /s /f /q .DS_Store
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	replaceText gruntfile.js AppX %projectName%
	replaceText backstop.json AppX %projectName%
	replaceText %projectName%.sublime-project AppX %projectName%
	if "%packageName%"=="" (
		replaceText gruntfile.js appx %projectName%
	) else (
		replaceText gruntfile.js appx %packageName%
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