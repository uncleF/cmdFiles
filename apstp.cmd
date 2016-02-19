:: Setup App Project

@echo off

set gitFlag=true
set packageName=
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
		if NOT [%2]==[] if NOT [%2]==[-r] (
			set packageName=%2
			shift
		)
	)
	shift
	goto options

:projectSetup
	if [%projectName%]==[] (
		goto errorName
	)
	echo Setting Up App Project %projectName%
	where git >nul 2>nul
	if %errorlevel%==1 (
		set gitFlag=false
	)
	call propn
	if %remoteFlag%==false (
		call uprcopy %projectName% %dirProjectApp% AppX
		md meta
	) else (
		if %gitFlag%==false (
			goto errorGit
		) else (
			call uprremote %projectName% %remoteProjectApp% AppX
		)
	)
	call uprcleanup
	md design
	md sources
	cd meta
	del .\*.ico /s /f /q >nul 2>nul
	del .\*.jpg /s /f /q >nul 2>nul
	del .\*.jpeg /s /f /q >nul 2>nul
	del .\*.png /s /f /q >nul 2>nul
	del .\*.gif /s /f /q >nul 2>nul
	del .\*.svg /s /f /q >nul 2>nul
	del .\*.txt /s /f /q >nul 2>nul
	cd ..
	if [%packageName%]==[] (
		set packageName=%projectName%
		set packageName=%packageName:A=a%
		set packageName=%packageName:B=b%
		set packageName=%packageName:C=c%
		set packageName=%packageName:D=d%
		set packageName=%packageName:E=e%
		set packageName=%packageName:F=f%
		set packageName=%packageName:G=g%
		set packageName=%packageName:H=h%
		set packageName=%packageName:I=i%
		set packageName=%packageName:J=j%
		set packageName=%packageName:K=k%
		set packageName=%packageName:L=l%
		set packageName=%packageName:M=m%
		set packageName=%packageName:N=n%
		set packageName=%packageName:O=o%
		set packageName=%packageName:P=p%
		set packageName=%packageName:Q=q%
		set packageName=%packageName:R=r%
		set packageName=%packageName:S=s%
		set packageName=%packageName:T=t%
		set packageName=%packageName:U=u%
		set packageName=%packageName:V=v%
		set packageName=%packageName:W=w%
		set packageName=%packageName:X=x%
		set packageName=%packageName:Y=y%
		set packageName=%packageName:Z=z%	
	)
	call uprreplace %projectName% AppX %packageName% appx
	replaceText gruntfile.js appx %packageName%
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