:: Check Remote Repos

@echo off

for /f "delims=" %%d in ('dir /b /ad') do (
	cd %%d
	if exist .git (
		echo %%d
		git fetch --dry-run --all
		echo ----------------------------------------------------------------------
	)
	cd ..
)
