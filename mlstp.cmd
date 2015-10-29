::Setup Mail Project

@echo off

set projectName=
set remoteFlag=false
set gitFlag=true

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
	where git >nul 2>nul
	if "%errorlevel%"=="1" (
		set gitFlag=false
	)
	call propn
	if "%remoteFlag%"=="false" (
		md %projectName%
		cd %projectName%
		md dev
		xcopy %dirProjectMail%\dev .\dev /s /q /y >nul 2>nul
		copy %dirProjectMail%\gruntfile.js /y >nul 2>nul
		copy %dirProjectMail%\package.json /y >nul 2>nul
		copy %dirProjectMail%\backstop.json /y >nul 2>nul
		copy %dirProjectMail%\.*.yml /y >nul 2>nul
		copy %dirProjectMail%\.*rc /y >nul 2>nul
		copy %dirProjectMail%\.editorconfig /y >nul 2>nul
		copy %dirProjectMail%\.gitattributes /y >nul 2>nul
		copy %dirProjectMail%\.gitignore /y >nul 2>nul
		copy %dirProjectMail%\MailX.sublime-project .\%projectName%.sublime-project /y >nul 2>nul
	) else (
		if "%gitFlag%"=="false" (
			goto errorGit
		) else (
			git clone %remoteProjectMail% %projectName%
			cd %projectName%
			rd .git /s /q
			del .\*.md /s /f /q >nul 2>nul
			ren .\MailX.sublime-project .\%projectName%.sublime-project
		)
	)
	md design
	md sources
	del .DS_Store /s /f /q >nul 2>nul
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" >nul 2>nul
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

:errorGit
	echo Git is not available
	goto exit

:exit