:: npm Install Utility

@echo off

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
	call npm cache clear
	call npm update --save-dev
	goto exit

:errorAnswer
	echo Please Answer (y)es or (n)o
	goto npmQuestion

:exit
