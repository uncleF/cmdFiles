::Setup App Project

@echo off

set projectName=
set packageName=
set remoteFlag=false
set gitFlag=true

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
	where git >nul 2>nul
	if "%errorlevel%"=="1" (
		set gitFlag=false
	)
	call propn
	if "%remoteFlag%"=="false" (
		md %projectName%
		cd %projectName%
		md dev
		xcopy %dirProjectApp%\dev .\dev /s /q /y >nul 2>nul
		md meta
		xcopy %dirProjectApp%\meta .\meta /s /q /y >nul 2>nul
		copy %dirProjectApp%\gruntfile.js /y >nul 2>nul
		copy %dirProjectApp%\package.json /y >nul 2>nul
		copy %dirProjectApp%\backstop.json /y >nul 2>nul
		copy %dirProjectApp%\.*.yml /y >nul 2>nul
		copy %dirProjectApp%\.*rc /y >nul 2>nul
		copy %dirProjectApp%\.editorconfig /y >nul 2>nul
		copy %dirProjectApp%\.gitattributes /y >nul 2>nul
		copy %dirProjectApp%\.gitignore /y >nul 2>nul
		copy %dirProjectApp%\AppX.sublime-project .\%projectName%.sublime-project /y >nul 2>nul
	) else (
		if "%gitFlag%"=="false" (
			goto errorGit
		) else (
			git clone %remoteProjectApp% %projectName%
			cd %projectName%
			rd .git /s /q >nul 2>nul
			del .\*.md /s /f /q >nul 2>nul
			ren AppX.sublime-project %projectName%.sublime-project >nul 2>nul
		)
	)
	md design
	md sources
	del .\.DS_Store /s /f /q >nul 2>nul
	cd dev
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" >nul 2>nul
	cd ..
	cd meta
	del .\*.ico /s /f /q >nul 2>nul
	del .\*.jpg /s /f /q >nul 2>nul
	del .\*.jpeg /s /f /q >nul 2>nul
	del .\*.png /s /f /q >nul 2>nul
	del .\*.gif /s /f /q >nul 2>nul
	del .\*.svg /s /f /q >nul 2>nul
	del .\*.txt /s /f /q >nul 2>nul
	cd ..
	replaceText gruntfile.js AppX %projectName%
	replaceText package.json AppX %projectName%
	replaceText backstop.json AppX %projectName%
	replaceText %projectName%.sublime-project AppX %projectName%
	if "%packageName%"=="" (
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
	npm i
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