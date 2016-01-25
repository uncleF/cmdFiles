:: Reinstall Node Modules

@echo off

rd ./node_modules /s /q >nul 2>nul
npm cache clear
npm i --save-dev