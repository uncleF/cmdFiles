@ECHO OFF

IF EXIST project (
	sass --compass --sourcemap --watch project/res/sass.txsrc:project/res/css.txsrc
) ELSE (
	echo "Nothing To Watch"
)