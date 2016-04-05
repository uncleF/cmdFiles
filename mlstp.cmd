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

:errorName
	echo Please Enter Project Name
	goto exit

:errorGit
	echo Git is not available
	goto exit

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
	call uprnpm

:exit