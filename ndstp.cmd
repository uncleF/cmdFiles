:: Setup Node.js App Project

@echo off
setlocal

set projectName=
set packageName=
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
	if [%1]==[-n] if NOT [%2]==[] if NOT [%2]==[-r] if NOT [%2]==[-b] if NOT [%2]==[-p] (
		set projectName=%2
		shift
	)
	if [%1]==[-p] if NOT [%2]==[] if NOT [%2]==[-r] if NOT [%2]==[-b] if NOT [%2]==[-p] (
		set packageName=%2
		shift
	)
	if [%1]==[-b] if NOT [%2]==[] if NOT [%2]==[-r] if NOT [%2]==[-n] if NOT [%2]==[-p] (
		set branch=%2
		shift
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
		cd %dirProjectNode%
		set original=$(git symbolic-ref --short -q HEAD)
		git checkout %branch% >nul 2>nul
		cd ..
		md %projectName%
		cd %projectName%
		md dev
		xcopy %dirProjectNode%\dev dev /s /q /y >nul 2>nul
		md tests
		xcopy %dirProjectNode%\tests tests /s /q /y >nul 2>nul
		copy %dirProjectNode%\package.json /y >nul 2>nul
		copy %dirProjectNode%\.*rc /y >nul 2>nul
		copy %dirProjectNode%\.editorconfig /y >nul 2>nul
		copy %dirProjectNode%\.gitattributes /y >nul 2>nul
		copy %dirProjectNode%\.gitignore /y >nul 2>nul
		copy %dirProjectNode%\.npmignore /y >nul 2>nul
		copy %dirProjectNode%\AppXN.sublime-project .\%projectName%.sublime-project /y >nul 2>nul
		cd %dirProjectNode%
		git checkout %original% >nul 2>nul
		cd ../%projectName%
	) else (
		if %gitFlag%==false (
			goto errorGit
		) else (
			call uprremote %projectName% %remoteProjectNode% AppXN  %branch%
		)
	)
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
	replaceText gruntfile.js %projectName% %projectName%
	replaceText package.json %projectName% %projectName%
	replaceText %projectName%.sublime-project %projectName% %projectName%
	replaceText package.json appx %packageName%
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

endlocal