::Cleanup

@echo off

del .DS_Store /s /f /q >nul 2>nul
cd dev
for /f "delims=" %%d in ('dir /s /b /ad ^| sort /r') do rd "%%d" >nul 2>nul
cd ..