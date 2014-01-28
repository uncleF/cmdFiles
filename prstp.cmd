@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	echo "Setting Up Project %1"
	propn
	md %1
	cd %1
	md project
	xcopy %dirProjectsWeb%\project project /s /q /y
	xcopy %dirProjectsWeb%\build.xml /q /y
	xcopy %dirProjectsWeb%\config.rb /q /y
	# xcopy %dirProjectsWeb%\gruntfile.js /q /y
	# xcopy %dirProjectsWeb%\cssorder.json /q /y
	# xcopy %dirProjectsWeb%\package.json /q /y
	md meta
	md design
	md design\sprites
	del /s /f /q tx.*.*
	del /s /f /q .DS_Store
	cd project
	for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d"
	cd ..
	replaceText build.xml TemplateX %1
)