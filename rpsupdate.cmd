:: Update All Repos

@echo off

for /f "delims=" %%d in ('dir /b /ad') do (
	cd %%d
	if exist .git (
		echo %%d 
		git config core.fileMode false >nul 2>&1
		git fetch --all --prune >nul 2>&1
		git pull --all >nul 2>&1
		git pull --tags >nul 2>&1
		git remote prune origin >nul 2>&1
		git remote update --prune >nul 2>&1
		for /F "tokens=*" %%b in ('git for-each-ref --format="%%(refname:short)" refs/heads') do (
			for /F "delims=" %%u in ('git for-each-ref --format="%%(upstream:short)" refs/heads/%%b') do (
				git checkout %%b >nul 2>&1
				git pull				
			)
		)
		git branch --list | findstr /B /C:"  main" > nul 2>&1
		if errorlevel 1 (
			git checkout master >nul 2>&1
		) else (
			git checkout main >nul 2>&1
		)
		git clean -fdx
		echo ----------------------------------------------------------------------
	)
	cd ..
)
