:: Update Gems

@echo off
setlocal

call gem update --system
call gem update --no-document

endlocal