@ECHO OFF

set shareFlag="false"
IF NOT "%1"=="" (
	IF "%1"=="-s" (
		shareFlag=true
	) ELSE (
		echo "Invalid Parameters"
	)
)
IF %shareFlag%=="true" (
	ant -propertyfile %buildProperties% -Dbuild.share=share
) ELSE (
	ant -propertyfile %buildProperties%
)