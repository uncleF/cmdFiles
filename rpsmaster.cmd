:: Change All Repos to master

@echo off

for /f "delims=" %%d in ('dir /b /ad') do (
	cd %%d
	if exist .git (
		echo %%d
		git checkout master
		echo ----------------------------------------------------------------------
	)
	cd ..
)
