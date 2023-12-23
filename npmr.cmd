:: Reinstall Node Modules

@echo off
setlocal

rd .\node_modules /s /q
call npm cache clear
call npm i --save-dev

endlocal