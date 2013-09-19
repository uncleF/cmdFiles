@ECHO OFF

IF "%1"=="" (
	echo "Project Name Missing"
) ELSE (
	oecps
	cd %1
)