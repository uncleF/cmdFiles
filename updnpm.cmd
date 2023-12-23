:: Update npm

@echo off
setlocal

call npm-check -g -u
call npm install npm -g
call npm update -g

endlocal