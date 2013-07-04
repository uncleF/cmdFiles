@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	D:
	cd D:\Projects\Eclipse\%1
)