:: Setup Mail Project

@echo off

set gitFlag=true
set projectName=
set remoteFlag=false

:options
	if [%1]==[] (
		goto projectSetup
	)
	if [%1]==[-r] (
		set remoteFlag=true
	) else (
		set projectName=%1
	)
	shift
	goto options

:projectSetup
	if [%projectName%]==[] (
		goto errorName
	)
	echo Setting Up Mail Template Project %projectName%
	where git >nul 2>nul
	if %errorlevel%==1 (
		set gitFlag=false
	)
	call propn
	if %remoteFlag%==false (
		call uprcopy %projectName% %dirProjectMail% MailX
	) else (
		if %gitFlag%==false (
			goto errorGit
		) else (
			call uprremote %projectName% %remoteProjectMail% MailX
		)
	)
	call uprcleanup
	md design
	md sources
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
	npm cache clear
	npm update --save
	npm update --save-dev
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