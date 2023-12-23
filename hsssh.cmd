:: Run vagrant ssh for the Homestead

@echo off

set back=%~dp0
call hshm
vagrant ssh %*
cd %back%
