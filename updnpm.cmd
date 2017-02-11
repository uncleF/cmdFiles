:: Update npm

@echo off

call npm-check -g -u
call npm install npm -g
call npm update -g