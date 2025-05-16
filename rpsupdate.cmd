:: Update All Repos

@echo off
setlocal enabledelayedexpansion

for /f "delims=" %%d in ('dir /b /ad') do (
	cd %%d
	if exist .git (
		echo %%d
		git config core.fileMode false >nul 2>&1
		git fetch --all --prune >nul 2>&1
		git pull --tags >nul 2>&1
		for /F "tokens=*" %%b in ('git for-each-ref --format="%%(refname:short)" refs/heads') do (
			for /F "delims=" %%u in ('git for-each-ref --format="%%(upstream:short)" refs/heads/%%b') do (
				git checkout %%b >nul 2>&1
				git pull
			)
		)
		set defaultBranch=
		for /f "tokens=3" %%h in ('git remote show origin ^| findstr "HEAD branch"') do (
    	set defaultBranch=%%h
		)
		if defined defaultBranch (
    	git checkout !defaultBranch! >nul 2>&1
		) else (
    	echo Failed to detect default branch. Falling back...
	    git checkout main >nul 2>&1 || git checkout master >nul 2>&1
		)
		git clean -fd >nul 2>&1
		echo ----------------------------------------------------------------------
	)
	cd ..
)

endlocal