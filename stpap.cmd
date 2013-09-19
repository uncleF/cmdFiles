@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	echo "Setting Up Project %1"
	oecps
	md %1
	cd %1
	md project
	xcopy D:\Projects\Eclipse\AppX\project project /s /q /y
	xcopy D:\Projects\Eclipse\AppX\build.xml /q /y
	xcopy D:\Projects\Eclipse\AppX\config.rb /q /y
	del /s /f /q txex.*.*
	del /s /f /q txdemo.*.*
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