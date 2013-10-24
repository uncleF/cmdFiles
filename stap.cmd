@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	echo "Setting Up Project %1"
	opr
	md %1
	cd %1
	md project
	xcopy %dirProjectsApp%\project project /s /q /y
	xcopy %dirProjectsApp%\build.xml /q /y
	xcopy %dirProjectsApp%\config.rb /q /y
	del /s /f /q txex.*.*
	del /s /f /q txdemo.*.*
	del /s /f /q .DS_Store
	md sources
	md sources\"project meta images"
	md sources\"project sources"
	cd project
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	replaceText build.xml AppX %1
	IF "%2"=="" (
		replaceText build.xml appx %1
	) ELSE (
		replaceText build.xml appx %2
	)
)