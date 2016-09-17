:: Rename Current Project

@echo off

set newProjectName=

:options
	if [%1]==[] (
		goto projectSetup
	) else (
		set newProjectName=%1
	)
	shift
	goto options

:errorName
	echo Please Enter New Project Name
	goto exit

:errorDirectory
	echo This is Not a Project
	goto exit

:projectRename
	if [%newProjectName%]==[] (
		goto errorName
	)
	if exist dev (
		echo Renaming Project %oldProjectName%
		set oldProjectName=%cd%
		set oldPackageName=%oldProjectName%
		set oldPackageName=%oldPackageName:A=a%
		set oldPackageName=%oldPackageName:B=b%
		set oldPackageName=%oldPackageName:C=c%
		set oldPackageName=%oldPackageName:D=d%
		set oldPackageName=%oldPackageName:E=e%
		set oldPackageName=%oldPackageName:F=f%
		set oldPackageName=%oldPackageName:G=g%
		set oldPackageName=%oldPackageName:H=h%
		set oldPackageName=%oldPackageName:I=i%
		set oldPackageName=%oldPackageName:J=j%
		set oldPackageName=%oldPackageName:K=k%
		set oldPackageName=%oldPackageName:L=l%
		set oldPackageName=%oldPackageName:M=m%
		set oldPackageName=%oldPackageName:N=n%
		set oldPackageName=%oldPackageName:O=o%
		set oldPackageName=%oldPackageName:P=p%
		set oldPackageName=%oldPackageName:Q=q%
		set oldPackageName=%oldPackageName:R=r%
		set oldPackageName=%oldPackageName:S=s%
		set oldPackageName=%oldPackageName:T=t%
		set oldPackageName=%oldPackageName:U=u%
		set oldPackageName=%oldPackageName:V=v%
		set oldPackageName=%oldPackageName:W=w%
		set oldPackageName=%oldPackageName:X=x%
		set oldPackageName=%oldPackageName:Y=y%
		set oldPackageName=%oldPackageName:Z=z%
		set newPackageName=%newProjectName%
		set newPackageName=%newPackageName:A=a%
		set newPackageName=%newPackageName:B=b%
		set newPackageName=%newPackageName:C=c%
		set newPackageName=%newPackageName:D=d%
		set newPackageName=%newPackageName:E=e%
		set newPackageName=%newPackageName:F=f%
		set newPackageName=%newPackageName:G=g%
		set newPackageName=%newPackageName:H=h%
		set newPackageName=%newPackageName:I=i%
		set newPackageName=%newPackageName:J=j%
		set newPackageName=%newPackageName:K=k%
		set newPackageName=%newPackageName:L=l%
		set newPackageName=%newPackageName:M=m%
		set newPackageName=%newPackageName:N=n%
		set newPackageName=%newPackageName:O=o%
		set newPackageName=%newPackageName:P=p%
		set newPackageName=%newPackageName:Q=q%
		set newPackageName=%newPackageName:R=r%
		set newPackageName=%newPackageName:S=s%
		set newPackageName=%newPackageName:T=t%
		set newPackageName=%newPackageName:U=u%
		set newPackageName=%newPackageName:V=v%
		set newPackageName=%newPackageName:W=w%
		set newPackageName=%newPackageName:X=x%
		set newPackageName=%newPackageName:Y=y%
		set newPackageName=%newPackageName:Z=z%
		move .\%oldProjectName%.sublime-project .\%newProjectName%.sublime-project /y >nul 2>nul
		call uprreplace %newProjectName% %oldProjectName% %newPackageName% %oldPackageName%
		cd ..
		move .\%oldProjectName% .\%newProjectName% /y >nul 2>nul
		cd %newProjectName%
		goto exit
	) else (
		goto errorDirectory
	)

	:exit