@ECHO OFF

IF EXIST project (
	sass --compass --watch project/res/sass.dev:project/res/css.dev
) ELSE (
	echo "Nothing To Watch"
)