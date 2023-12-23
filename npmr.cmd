:: Reinstall Node Modules

@echo off

rd .\node_modules /s /q
call npm cache clear
call npm i --save-dev
