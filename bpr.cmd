@ECHO OFF

shareFlag=false
IF NOT "%1"=="" (
	IF "%1"=="-s" (
		shareFlag=true
	) ELSE (
		echo "Invalid Parameters"
	)
)