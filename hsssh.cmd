:: Run vagrant ssh for the Homestead

@echo off
setlocal

set back=%~dp0
call hshm
vagrant ssh %*
cd %back%

endlocal