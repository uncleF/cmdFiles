@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	echo "Setting Up Project %1"
	oecps
	md %1
	cd %1
	md project
	xcopy D:\Projects\Eclipse\TemplateX\project project /e /q /y
	xcopy D:\Projects\Eclipse\TemplateX\build.xml /q /y
	xcopy D:\Projects\Eclipse\TemplateX\config.rb /q /y
	del /s /f /q txex.*.*
	del /s /f /q txdemo.*.*
	md sources
	md sources\"project meta images"
	md sources\"project sources"
)