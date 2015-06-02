@echo off

set projectName=
set remoteFlag=false

if "%1"=="" (
	goto errorName
) else (
	if "%1"=="-r" (
		set remoteFlag=true
		if NOT "%2"=="" (
			set projectName=%2
			goto projectSetup			
		) else (
			goto errorName
		)
	) else (
		set projectName=%1
		if "%2"=="-r" (
			set remoteFlag=true
		)
		goto projectSetup
	)
)

:projectSetup
	echo Setting Up Mail Template Project %projectName%
	%homeDirProjects%
	cd %dirProjects%
	if "%remoteFlag%"=="false" (
		md %1
		cd %1
		md dev
		md design
		md sources
		xcopy %dirProjectsWeb%dev dev /s /q /y
		copy %dirProjectsMail%gruntfile.js /y
		copy %dirProjectsMail%package.json /y
		copy %dirProjectsMail%backstop.json /y
		copy %dirProjectsWeb%.*.yml /y
		copy %dirProjectsMail%.*rc /y
		copy %dirProjectsMail%.editorconfig /y
		copy %dirProjectsMail%MailX.sublime-project .\%projectName%.sublime-project /y
	) else (
		git clone %remoteProjectMail% %projectName%
		cd %projectName%
		del /s /f /q *.md
		rd .git /s /q
		ren TemplateX.sublime-project %projectName%.sublime-project
	)
	del /s /f /q .DS_Store
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	replaceText gruntfile.js MailX %projectName%
	replaceText backstop.json MailX %projectName%
	replaceText %projectName%.sublime-project MailX %projectName%
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