:: Setup Mail Project

@echo off

set projectName=
set remoteFlag=false
set branch=master
set gitFlag=true

:options
	if [%1]==[] (
		goto projectSetup
	)
	if [%1]==[-r] (
		set remoteFlag=true
	)
	if [%1]==[-n] if NOT [%2]==[] if NOT [%2]==[-r] if NOT [%2]==[-b] (
		set projectName=%2
		shift
	)
	if [%1]==[-b] if NOT [%2]==[] if NOT [%2]==[-r] if NOT [%2]==[-n] (
		set branch=%2
		shift
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
		call uprcopy %projectName% %dirProjectMail% MailX %branch%
	) else (
		if %gitFlag%==false (
			goto errorGit
		) else (
			call uprremote %projectName% %remoteProjectMail% MailX %branch%
		)
	)
	call uprcleanup
	md design
	md sources
	replaceText gruntfile.js MailX %projectName%
	replaceText %projectName%.sublime-project MailX %projectName%
	call uprnpm

:exit
