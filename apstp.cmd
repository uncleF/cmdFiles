@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	echo "Setting Up Project %1"
	propn
	md %1
	cd %1
	md project
	xcopy %dirProjectsApp%\project project /s /q /y
	xcopy %dirProjectsApp%\build.xml /q /y
	xcopy %dirProjectsApp%\config.rb /q /y
	# xcopy %dirProjectsApp%\gruntfile.js /q /y
	# xcopy %dirProjectsApp%\cssorder.json /q /y
	# xcopy %dirProjectsApp%\package.json /q /y
	md meta
	md design
	md design\sprites
	del /s /f /q tx.*.*
	del /s /f /q .DS_Store
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