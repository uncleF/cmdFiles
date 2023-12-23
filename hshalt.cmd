:: Run vagrant halt for Homestead

@echo off
setlocal

set back=%~dp0
call hshm
vagrant halt %*
cd %back%

endlocal