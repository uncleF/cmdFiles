:: Clone Remote Utility

@echo off

git clone -b %4 %2 %1
cd %1
rd .git /s /q >nul 2>nul
del .\*.md /s /f /q >nul 2>nul
ren .\%3.sublime-project .\%1.sublime-project >nul 2>nul
