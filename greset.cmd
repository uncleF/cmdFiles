:: Reset Git Repo

@echo off
setlocal

call git clean -xfd
call git submodule foreach --recursive git clean -xfd
call git reset --hard
call git submodule foreach --recursive git reset --hard
call git submodule update --init --recursive

endlocal