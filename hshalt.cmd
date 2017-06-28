:: Run vagrant halt for Homestead

@echo off

set back=%~dp0
call hshm
vagrant halt %*
cd %back%