:: Update All Repos

@echo off

for /f "delims=" %%d in ('dir /b /ad') do (
	cd %%d
	if exist .git (
		echo %%d
		git config core.fileMode false
		git fetch --all --prune
		git pull --all
		git remote prune origin
		git remote update --prune
		for /F "tokens=*" %%branch in ('git for-each-ref --format="%%(refname:short)" refs/heads') do (
			git checkout %%branch
			git pull
		)
		git checkout master
		git clean -fdx
		echo ----------------------------------------------------------------------
	)
	cd ..
)