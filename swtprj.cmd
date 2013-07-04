@ECHO OFF

IF EXIST project (
	sass --compass --sourcemap --debug-info --watch project/res/sass.txsrc:project/res/css.txsrc
) ELSE (
	echo "Nothing To Watch"
)