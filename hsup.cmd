:: Run vagrant up for Homestead

@echo off

set back=%~dp0
call hshm
vagrant up
cd %back%