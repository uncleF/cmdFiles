:: Run vagrant up for Homestead

@echo off
setlocal

set back=%~dp0
call hshm
vagrant up %*
cd %back%

endlocal