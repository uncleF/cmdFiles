:: Setup App Project

@echo off

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
	echo Setting Up App Project %projectName%
	where git >nul 2>nul
	if %errorlevel%==1 (
		set gitFlag=false
	)
	call propn
	if %remoteFlag%==false (
		call uprcopy %projectName% %dirProjectApp% AppX %branch%
		md tests
		xcopy %dirProjectApp%\tests tests /s /q /y >nul 2>nul
	) else (
		if %gitFlag%==false (
			goto errorGit
		) else (
			call uprremote %projectName% %remoteProjectApp% AppX %branch%
			rd meta /s /q >nul 2>nul
		)
	)
	call uprcleanup
	md design
	md sources
	md meta
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
	call uprnpm

:exit